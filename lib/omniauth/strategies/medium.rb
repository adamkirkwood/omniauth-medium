require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Medium < OmniAuth::Strategies::OAuth2
      option :name, 'medium'
      option :scope, 'basicProfile,publishPost'

      option :client_options, {
        site: 'https://api.medium.com/v1',
        authorize_url: 'https://medium.com/m/oauth/authorize',
        token_url: "https://api.medium.com/v1/tokens"
      }

      uid { info["id"] }

      info { @info ||= access_token.get("me").parsed["data"] }
    end
  end
end
