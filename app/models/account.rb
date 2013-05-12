#coding: utf-8
class Account < ActiveRecord::Base
  has_many :ng_words, :dependent => :delete_all
  attr_accessible :last_login, :twitter_id, :twitter_secret, :twitter_token

end
