# frozen_string_literal: true

require_relative '../poll'

module Mastodon
  module REST
    module Polls
      include Mastodon::REST::Utils

      def poll(id)
        perform_request_with_object(:get, "/api/v1/polls/#{id}",
                                    {}, Mastodon::Poll)
      end

      def vote(id, *choices)
        perform_request_with_object(:post, "/api/v1/polls/#{id}/votes",
                                    { choices: choices }, Mastodon::Poll)
      end
    end
  end
end
