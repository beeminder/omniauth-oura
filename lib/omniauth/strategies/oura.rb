require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Oura < OmniAuth::Strategies::OAuth2
      option :name, 'oura'
      #option :pkce, true

      option :client_options, {
        :site => 'https://ouraring.com/',
        :authorize_url => 'https://cloud.ouraring.com/oauth/authorize',
        :token_url => 'https://api.ouraring.com/oauth/token',
        :response_type => 'code'
      }
      # Bugfix for regression introduced after omniauth-oauth2 v1.3.1
      # details: https://github.com/intridea/omniauth-oauth2/issues/8
      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end
    end
  end
end

