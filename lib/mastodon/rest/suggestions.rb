# frozen_string_literal: true

require_relative '../rest/utils'
require_relative '../account'

module Mastodon
  module REST
    module Suggestions
      include Mastodon::REST::Utils

      # Get "who to follow" suggestions for authenticated user
      # @return [Mastodon::Collection<Mastodon::Account>]
      def suggestions
        perform_request_with_collection(:get, '/api/v1/accounts/suggestions',
                                        {}, Mastodon::Account)
      end

      # Remove account from suggestions
      # @param id [Integer]
      # @return [Boolean]
      def remove_suggestion(id)
        !perform_request(:delete,
                         "/api/v1/suggestions/#{id}").nil?
      end
    end
  end
end
