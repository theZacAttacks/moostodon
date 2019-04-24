# frozen_string_literal: true

require_relative 'utils'
require_relative '../filter'

module Mastodon
  module REST
    module Filters
      include Mastodon::REST::Utils

      # Create a new filter
      # @param options [Hash]
      # @option options :phrase [String]
      # @option options :context [Array<String>]
      # @option options :irreversible [Boolean]
      # @option options :whole_word [Boolean]
      # @option options :expires_in [Integer]
      # @returns [Mastodon::Filter]
      def create_filter(options = {})
        context = options.delete(:context)
        context = [ context ] unless context.kind_of? Array
        options['context[]'] = context
        
        perform_request_with_object(:post, '/api/v1/filters',
                                    options, Mastodon::Filter)
      end

      # Gets a filter
      # @param id [Integer]
      # @returns [Mastodon::Filter]
      def filter(id)
        perform_request_with_object(:get, "/api/v1/filters/#{id}",
                                    {}, Mastodon::Filter)
      end

      # Gets all filters
      # @returns [Mastodon::Collection<Mastodon::Filter>]
      def filters
        perform_request_with_collection(:get, '/api/v1/filters',
                                        {}, Mastodon::Filter)
      end

      # Update an existing filter
      # @param id [Integer]
      # @param options [Hash]
      # @option options :phrase [String]
      # @option options :context [Array<String>]
      # @option options :irreversible [Boolean]
      # @option options :whole_word [Boolean]
      # @option options :expires_in [Integer]
      # @returns [Mastodon::Filter]
      def update_filter(id, options = {})
        context = options.delete(:context)
        context = [ context ] unless context.kind_of? Array
        options['context[]'] = context
        
        perform_request_with_object(:put, "/api/v1/filters/#{id}",
                                    options, Mastodon::Filter)
      end

      # Delete a filter
      # @param id [Integer]
      # @returns [Mastodon::Filter]
      def delete_filter(id)
        !perform_request(:delete, "/api/v1/filters/#{id}").nil?
      end
    end
  end
end
