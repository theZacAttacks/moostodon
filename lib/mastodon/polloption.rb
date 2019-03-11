# frozen_string_literal: true

module Mastodon
  class PollOption < Mastodon::Base
    # @!attribute [r] title
    #   @return [String]
    # @!attribute [r] votes_count
    #   @return [Integer]
    normal_attr_reader :title,
                       :votes_count
  end
end
