require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Stagebloc < OmniAuth::Strategies::OAuth2
      option :name, 'stagebloc'

      option :client_options, {
        site: 'https://api.stagebloc.com/v1',
        authorize_url: 'https://stagebloc.com/connect',
        token_url: 'https://api.stagebloc.com/v1/oauth2/token'
      }

      option :access_token_options, {
        header_format: 'OAuth %s'
      }

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('users/me').parsed
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end
    end
  end
end

OAuth2::Response.register_parser(:stagebloc_parser, 'application/json') do |body|
  parsed = MultiJson.respond_to?(:adapter) ? MultiJson.load(body) : MultiJson.decode(body) rescue body
  parsed['data']
end

