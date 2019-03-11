# frozen_string_literal: true

require_relative '../poll'

module Mastodon
  module REST
    module Polls
      include Mastodon::REST::Utils

      # Return a poll
      # @param id [String]
      # @return [Mastodon::Poll]
      def poll(id)
        perform_request_with_object(:get, "/api/v1/polls/#{id}",
                                    {}, Mastodon::Poll)
      end

      # Vote on a poll
      # @param id [String]
      # @param choices [Array<Integer>]
      # @return [Mastodon::Poll]
      def vote(id, *choices)
        #choices = [ choices ] unless choices.kind_of? Array
        perform_request_with_object(:post, "/api/v1/polls/#{id}/votes",
                                    { choices: choices }, Mastodon::Poll)
      end
    end
  end
end
