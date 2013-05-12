#coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
    if logged_in?
      redirect_to @current_account
    else
      session.delete(:account_id) 
    end
  end

  def create
    
    auth = request.env["omniauth.auth"]
    @account = Account.find_by_twitter_id(auth["uid"])

    unless @account.present?
      @account = Account.new
    end

    @account.twitter_id = auth['uid']
    @account.twitter_secret = auth['credentials']['secret']
    @account.twitter_token = auth['credentials']['token']
    
    twitter_user = Twitter::Client.new(
      :oauth_token => auth['credentials']['token'],
      :oauth_token_secret => auth['credentials']['secret']
    ).user

    @account.twitter_image_url = twitter_user.profile_image_url
    @account.twitter_screen_name = twitter_user.screen_name

    if @account.save
      session[:account_id] = @account.id
      redirect_to @account
    else
      session.delete(:account_id) 
      flash[:error] = "ごめんなさい"
      render "new"
    end
    
  end

  def destroy
    session.delete(:account_id) 
    redirect_to :root, :notice => "認証を外しました"
  end

end
