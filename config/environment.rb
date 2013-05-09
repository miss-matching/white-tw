# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WhiteTw::Application.initialize!


# Set the Twitter OAuth info to VM
Twitter.configure do |config|
  config.consumer_key = Constants::CONSUMER_KEY
  config.consumer_secret = Constants::CONSUMER_SECRET
end

