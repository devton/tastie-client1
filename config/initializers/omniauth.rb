APP_ID = '123'
APP_SECRET = '1234'

# Update your custom Omniauth provider URL here

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth_sn, APP_ID, APP_SECRET
end