#coding: utf-8
class Account < ActiveRecord::Base
  has_many :ng_words, :dependent => :delete_all
  attr_accessible :last_login, :twitter_id, :twitter_secret, :twitter_token

  def assign_twitter_info( auth )

    self.twitter_id = auth['uid']
    self.twitter_secret = auth['credentials']['secret']
    self.twitter_token = auth['credentials']['token']
    
    twitter_user = Twitter::Client.new(
      :oauth_token => auth['credentials']['token'],
      :oauth_token_secret => auth['credentials']['secret']
    ).user

    self.twitter_image_url = twitter_user.profile_image_url
    self.twitter_screen_name = twitter_user.screen_name

  end
end
