#coding: utf-8
class ApplicationController < ActionController::Base
  before_filter :require_login
  protect_from_forgery

  private

  def require_login
    unless logged_in?
      flash[:error] = "ログインして下さい"
      redirect_to root_url
    end
  end

  def current_account
    @current_account ||= session[:account_id] && Account.find_by_id(session[:account_id])
  end

  def logged_in?
    !!current_account
  end

end
