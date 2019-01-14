# frozen_string_literal: true

require_relative 'utils'
require_relative '../list'

module Mastodon
  module REST
    module Lists
      include Mastodon::REST::Utils

      
      def list(id)
        perform_request_with_object(:get, "/api/v1/lists/#{id}",
                                    {}, Mastodon::List)
      end

      def lists
        perform_request_with_collection(:get, '/api/v1/lists',
                                        {}, Mastodon::List)
      end

      def create_list(options = {})
        perform_request_with_object(:post, '/api/v1/lists',
                                    options, Mastodon::List)
      end

      def update_list(id, options = {})
        perform_request_with_object(:put, "/api/v1/lists/#{id}",
                                    options, Mastodon::List)
      end

      def delete_list(id)
        !perform_request(:delete, "/api/v1/lists/#{id}").nil?
      end

      def add_accounts_to_list(id, options = {})
        options['account_ids[]'] ||= options.delete(:account_ids)
        perform_request_with_object(:post, "/api/v1/lists/#{id}/accounts",
                                    options, Mastodon::List)
      end

      def delete_accounts_from_list(id, options = {})
        options['account_ids[]'] ||= options.delete(:account_ids)
        perform_request_with_object(:delete, "/api/v1/lists/#{id}/accounts",
                                    options, Mastodon::List)
      end                                 
    end
  end
end
