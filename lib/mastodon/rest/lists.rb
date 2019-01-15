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
      # @param title [String]
      # @return [Mastodon::List]
      def create_list(title)
        options = { title: title }
        perform_request_with_object(:post, '/api/v1/lists',
                                    options, Mastodon::List)
      end

      # Update a list
      # @param id [Integer]
      # @param options [Hash]
      # @option options :title [String]
      # @return [Mastodon::List]
      def update_list(id, options = {})
        perform_request_with_object(:put, "/api/v1/lists/#{id}",
                                    options, Mastodon::List)
      end

      # Gets the accounts that are in a list
      # @param id [Integer]
      # @param options [Hash]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def list_accounts(id, options = {})
        perform_request_with_collection(:get, "/api/v1/lists/#{id}/accounts",
                                        options, Mastodon::List)
      end

      # Gets the lists this account is a part of
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::List>]
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

      #   Add accounts to a list
      # @param id [Integer]
      # @param accounts [Array<Integer>]
      def list_add_accounts(id, *accounts)
        options = {}
        options['account_ids[]'] = accounts
        perform_request(:post, "/api/v1/lists/#{id}/accounts",
                        options)
      end

      #   Add accounts to a list
      # @param id [Integer]
      # @param accounts [Array<Integer>]
      def list_remove_accounts(id, *accounts)
        options = {}
        options['account_ids[]'] = accounts
        perform_request(:delete, "/api/v1/lists/#{id}/accounts",
                        options)
      end
    end
  end
end
