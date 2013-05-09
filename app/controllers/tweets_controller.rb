# -*- coding: utf-8 -*-

class TweetsController < ApplicationController

  # DELETE /index
  def index
    account = Account.where(:id => params[:account_id].to_i).first
    Twitter.configure do |config|
      config.consumer_key = Constants::CONSUMER_KEY
      config.consumer_secret = Constants::CONSUMER_SECRET
    end

    twitter_client = Twitter::Client.new(
      :oauth_token => account.twitter_token,
      :oauth_token_secret => account.twitter_secret
    )

    tweets = twitter_client.user_timeline.select do |status|
      account.ng_words.any? { |word| /#{word}/ =~ status[:text] }
    end
    twitter_client.status_destroy *tweets.map { |tweet| tweet[:id] }
    redirect_to root_url
  end

end
