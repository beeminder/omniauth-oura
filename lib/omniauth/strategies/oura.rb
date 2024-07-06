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
      def authorize_params
        super.tap do |params|
          log(:debug, params[:scope])
        end
      end 
      def setup_phase
        super
      end
      def request_phase
        super
      end
      def callback_phase
        super
      end
      # Bugfix for regression introduced after omniauth-oauth2 v1.3.1
      # details: https://github.com/intridea/omniauth-oauth2/issues/8
      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end
      info do
        { email: raw_info['email'] }
      end
      extra do 
        { raw_info: raw_info }
      end
      def raw_info 
        @raw_info ||= MultiJson.load(access_token.get("https://api.ouraring.com/v2/usercollection/personal_info").body) 
      end
    end
  end
end

