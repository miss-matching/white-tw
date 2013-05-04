class Account < ActiveRecord::Base
  attr_accessible :last_login, :twitter_id, :twitter_secret, :twitter_token
end
