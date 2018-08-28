# frozen_string_literal: true

module Mastodon
  module Entities
    # When talking about another user.
    class Mention < Mastodon::Base
      # @!attribute [r] id
      #   @return [String] Account ID
      # @!attribute [r] acct
      #   @return [String]
      # @!attribute [r] url
      #   @return [String]

      normal_attr_reader :id, :acct, :url
    end
  end
end
