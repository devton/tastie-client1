APP_ID = '123'
APP_SECRET = '1234'

# Update your custom Omniauth provider URL here
CUSTOM_PROVIDER_URL = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :webmais, APP_ID, APP_SECRET
end