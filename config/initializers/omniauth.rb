Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :artsy, ENV['ARTSY_CLIENT_ID'], ENV['ARTSY_CLIENT_SECRET']
end

OmniAuth.config.logger = Rails.logger
