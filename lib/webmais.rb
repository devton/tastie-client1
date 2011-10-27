require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
 module Strategies

   class Webmais < OAuth2

    def initialize(app, api_key = nil, secret_key = nil, options = {}, &block)
      client_options = {
        :site =>  CUSTOM_PROVIDER_URL,
        :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/webmais/authorize",
        :access_token_url => "#{CUSTOM_PROVIDER_URL}/auth/webmais/access_token"
      }
      super(app, :webmais, api_key, secret_key, client_options, &block)
    end

protected

    def user_data
      @data ||= MultiJson.decode(@access_token.get("/auth/webmais/user.json"))
    end

    def request_phase
      options[:scope] ||= "read"
      super
    end

    def user_hash
      user_data
    end

    def auth_hash
      OmniAuth::Utils.deep_merge(super, {
          'uid' => user_data["uid"],
          'user_info' => user_data['user_info'],
          'extra' => {
              'first_name' => user_data['extra']['first_name'],
              'last_name' => user_data['extra']['last_name'],
          }
      })
    end
   end
 end
end
