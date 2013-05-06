#coding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
    if logged_in?
      redirect_to @current_account
    end
  end

  def create
    auth = request.env["omniauth.auth"]
    @account = Account.find_by_twitter_id(auth["uid"])

    unless @account.present?
      @account = Account.new
      @account.twitter_id = auth["uid"]
    end

    @account.twitter_secret = auth['credentials']['secret']
    @account.twitter_token = auth['credentials']['token']
    @account.last_login = Date.today.to_time.to_datetime
   
    # Twitter.configure do |config|
    #   config.oauth_token = auth['credentials']['token']
    #   config.oauth_token_secret = auth['credentials']['secret']
    # end

    if @account.save
      session[:account_id] = @account.id
      redirect_to @account
    else
      flash[:error] = "ごめんなさい"
      render "new"
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "認証を外しました"
  end
end
