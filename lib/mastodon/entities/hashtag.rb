# frozen_string_literal: true

module Mastodon
  module Entities
    # Hashtags are the only searchable item inside toots.
    class Hashtag < Mastodon::Base
      # @!attribute [r] name
      #   @return [String]
      # @!attribute [r] url
      #   @return [String]

      normal_attr_reader :name, :url
    end
  end
end
