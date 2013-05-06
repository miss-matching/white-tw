# -*- coding: utf-8 -*-
require 'spec_helper'

describe TweetsController do

  before do
    TweetsController.any_instance.should_receive(:logged_in?).and_return(true)
  end

  describe "DELETE 'index'" do

    let(:account) do
      account = FactoryGirl.create(:account)
      account.stub(:ng_words).and_return(["NG"])
      account
    end

    before do
      @account = account
      Account.stub(:where).and_return([@account])
      Twitter.stub(:configure)
      Twitter.stub(:user_timeline).and_return([
          { :id => 111, :text => "NG" },
          { :id => 222, :text => "ok" },
          { :id => 333, :text => "NG word" }
        ])
      Twitter.stub(:status_destroy)
    end

    it "configures `Tweets` with specified account" do
      Account.should_receive(:where).with(:id => @account.id)
      Twitter.should_receive(:configure) do |&args|
        options = double("options")
        options.stub(:consumer_key=)
        options.stub(:consumer_secret=)
        options.should_receive(:oauth_token=).with(@account.twitter_token)
        options.should_receive(:oauth_token_secret=).with(@account.twitter_secret)
        args.call options
        true
      end
      delete :index, :account_id => @account.id
    end

    it "queries tweets" do
      Twitter.should_receive(:user_timeline)
      delete :index, :account_id => @account.id
    end

    it "destroys tweets that contains ng words" do
      Twitter.should_receive(:status_destroy).with(111, 333)
      delete :index, :account_id => @account.id
    end
  end

end
