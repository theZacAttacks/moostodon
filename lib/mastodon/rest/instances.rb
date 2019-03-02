# frozen_string_literal: true

require_relative '../rest/utils'
require_relative '../instance'

module Mastodon
  module REST
    module Instances
      include Mastodon::REST::Utils

      # Retrieve the current instance. Does not require authentication
      # @return [Mastodon::Instance]
      def instance
        perform_request_with_object(:get, '/api/v1/instance', {},
                                    Mastodon::Instance)
      end

      # Get user domain blocks
      # @param options [Hash]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<String>]
      def domain_blocks(options = {})
        perform_request_with_collection(:get, '/api/v1/domain_blocks',
                                        options, String)
      end

      # Block a domain
      # @param domain [String]
      # @return [Boolean]
      def block_domain(domain)
        !perform_request(:post, '/api/v1/domain_blocks',
                         { domain: domain }).nil?
      end

      # Unblock a domain
      # @param domain [String]
      # @return [Boolean]
      def unblock_domain(domain)
        !perform_request(:delete, '/api/v1/domain_blocks',
                         { domain: domain }).nil?
      end
    end
  end
end
