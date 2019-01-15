# frozen_string_literal: true

require_relative 'utils'
require_relative '../list'

module Mastodon
  module REST
    module Lists
      include Mastodon::REST::Utils

      # Retrieve list
      # @param id [Integer]
      # @return [Mastodon::List]
      def list(id)
        perform_request_with_object(:get, "/api/v1/lists/#{id}",
                                    {}, Mastodon::List)
      end

      # Retrieve all lists
      # @param id [Integer]
      # @return [Mastodon::Collections<Mastodon::List>]
      def lists
        perform_request_with_collection(:get, '/api/v1/lists',
                                        {}, Mastodon::List)
      end

      # Create a new list
      # @param options [Hash]
      # @return [Mastodon::List]
      def create_list(options = {})
        perform_request_with_object(:post, '/api/v1/lists',
                                    options, Mastodon::List)
      end

      # Update a list
      # @param id [Integer]
      # @param options [Hash]
      # @return [Mastodon::List]
      def update_list(id, options = {})
        perform_request_with_object(:put, "/api/v1/lists/#{id}",
                                    options, Mastodon::List)
      end

      def list_accounts(id, options = {})
        perform_request_with_collection(:get, "/api/v1/lists/#{id}/accounts",
                                        options, Mastodon::List)
      end

      def account_lists(id)
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/lists",
                                        {}, Mastodon::List)
      end
      # Delete a list
      # @param id [Integer]
      # @return [Boolean]
      def delete_list(id)
        !perform_request(:delete, "/api/v1/lists/#{id}").nil?
      end

      # Add accounts to a list
      # @param id [Integer]
      # @param options [Hash]
      # @return [Mastodon::List]
      def add_accounts(id, options = {})
        options['account_ids[]'] ||= options.delete(:account_ids)
        perform_request_with_object(:post, "/api/v1/lists/#{id}/accounts",
                                    options, Mastodon::List)
      end

      # Remove accounts from a list
      # @param id [Integer]
      # @param options [Hash]
      # @return [Mastodon::List]
      def remove_accounts(id, options = {})
        options['account_ids[]'] ||= options.delete(:account_ids)
        perform_request_with_object(:delete, "/api/v1/lists/#{id}/accounts",
                                    options, Mastodon::List)
      end                                 
    end
  end
end
