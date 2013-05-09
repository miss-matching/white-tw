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

    @account.assign_twitter_info( auth )

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
