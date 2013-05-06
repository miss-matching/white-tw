Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Constants::CONSUMER_KEY, Constants::CONSUMER_SECRET
end

