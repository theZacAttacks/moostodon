# frozen_string_literal: true

module Mastodon
  class Instance < Mastodon::Base
    # @!attribute [r] uri
    #   @return [String]
    # @!attribute [r] title
    #   @return [String]
    # @!attribute [r] description
    #   @return [String]
    # @!attribute [r] email
    #   @return [String]
    # @!attribute [r] version
    #   @return [String]
    # @!attribute [r] urls
    #   @return [Hash]
    # @!attribute [r] thumbnail
    #   @return [String]
    # @!attribute [r] max_toot_chars
    #   @return [Integer]

    normal_attr_reader :uri,
                       :title,
                       :description,
                       :email,
                       :version,
                       :urls,
                       :thumbnail,
                       :max_toot_chars
  end
end
