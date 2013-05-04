#coding: utf-8
class SessionsController < ApplicationController
  
  def new
    
    @time_line = Array.new
    @time_line = Twitter.home_timeline

  end

  def create
    auth = request.env["omniauth.auth"]
#    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
#    session[:user_id] = user.id
   
    Twitter.configure do |config|
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end
    @login = true
    redirect_to :action => "new", :notice => "認証しました！"
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "認証を外しました"
  end
end
