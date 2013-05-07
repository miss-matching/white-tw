#coding: utf-8
require 'spec_helper'

describe SessionsController do
  
  before :all do
    @logged_in_account = FactoryGirl.create(:account)
  end

  let(:logged_in_session) { {:account_id => @logged_in_account.id} }
  let(:logged_out_session) { {:account_id => nil} }

  describe "GET 'new'" do
    describe "with logged in session" do
      it "redirects to current account" do
        get :new,{}, logged_in_session
        expect( response ).to redirect_to @logged_in_account
      end
    end
    
    describe "with logged out session" do
      it "redirects to current account" do
        get :new,{},logged_out_session
        expect( response ).to be_success
      end
    end
  end

  describe "GET 'create'" do
    pending "twitter認証をMockしなきゃならんね"
  end

  describe "DELETE 'destroy'" do
    it "destroys session by key ':account_id' " do
      delete :destroy, {}, logged_in_session
      expect( session[:account_id] ).to be_nil
    end

    it "redirects to the root url" do
      delete :destroy, {}, logged_in_session
      expect( response ).to redirect_to :root
    end

  end

end
