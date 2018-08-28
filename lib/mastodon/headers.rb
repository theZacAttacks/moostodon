# frozen_string_literal: true

module Mastodon
  # Class to handle headers. Important for OAuth2 to work properly.
  class Headers
    # @param client [Mastodon::Client]
    def initialize(client)
      @client = client
    end

    # @return [Hash]
    def request_headers
      {
        user_agent: @client.user_agent,
        accept: '*/*',
        authorization: "Bearer #{@client.bearer_token}"
      }
    end
  end
end
