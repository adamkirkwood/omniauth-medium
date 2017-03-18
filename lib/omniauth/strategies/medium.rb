require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Oauth2 strategy for medium.com
    class Medium < OmniAuth::Strategies::OAuth2
      option :name, 'medium'
      option :scope, 'basicProfile,listPublications'

      option :client_options,
             site: 'https://api.medium.com/v1',
             authorize_url: 'https://medium.com/m/oauth/authorize',
             token_url: 'https://api.medium.com/v1/tokens'

      uid { info['id'] }

      info { @info ||= access_token.get('me').parsed['data'] }

      def callback_url
        # Fixes regression in omniauth-oauth2 v1.4.0 by
        # https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
        options[:callback_url] || (full_host + script_name + callback_path)
      end
    end
  end
end
