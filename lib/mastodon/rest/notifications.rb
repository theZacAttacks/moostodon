# frozen_string_literal: true

require_relative '../rest/utils'
require_relative '../notification'

module Mastodon
  module REST
    module Notifications
      include Mastodon::REST::Utils

      # Get a list of notifications for the authenticated user
      # @return [Mastodon::Collection<Mastodon::Notification>]
      def notifications
        perform_request_with_collection(:get, '/api/v1/notifications', {},
                                        Mastodon::Notification)
      end
    end
  end
end
