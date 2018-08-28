# frozen_string_literal: true

require 'addressable/uri'
require 'http'
require 'oj'
require_relative '../error'
require_relative '../headers'

module Mastodon
  module REST
    class Request
      def initialize(client, request_method, path, options = {})
        @client         = client
        @request_method = request_method
        @uri            = Addressable::URI.parse(@client.base_url + path)
        @headers        = Mastodon::Headers.new(@client).request_headers
        @path           = @uri.path
        @options        = options
        # rubocop:disable GuardClause
        if @options.is_a?(Hash) && @options[:headers]
          @headers = @options.delete(:headers).merge @headers
        end
        # rubocop:enable GuardClause
      end

      def perform
        options_key = @request_method == :get ? :params : :form
        response = http_client.headers(@headers)
                              .public_send(@request_method, @uri.to_s,
                                           options_key => @options)

        STDERR.puts response.body if ENV['DEBUG'] == 'true'

        r_body = response.body.empty? ? '' : Oj.load(response.to_s, mode: :null)
        fail_or_return(response.code, r_body)
      end

      private

      def fail_or_return(code, body)
        if Mastodon::Error::ERRORS.include?(code)
          raise Mastodon::Error::ERRORS[code].from_response(body)
        end
        body
      end

      def http_client
        HTTP.timeout(:per_operation, connect: @client.timeout[:connect],
                                     read: @client.timeout[:read],
                                     write: @client.timeout[:write])
      end
    end
  end
end
