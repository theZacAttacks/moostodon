# frozen_string_literal: true

require_relative 'polloption'

module Mastodon
  class Poll < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] expires_at
    #   @return [String]
    # @!attribute [r] votes_count
    #   @return [Integer]
    # @!attribute [r] expired?
    #   @return [Boolean]
    # @!attribute [r] multiple?
    #   @return [Boolean]
    # @!attribute [r] voted?
    #   @return [Boolean]
    # @!attribute [r] options
    #   @return [Mastodon::Collection<Mastodon::PollOption>]
    
    normal_attr_reader :id,
                       :expires_at,
                       :votes_count

    predicate_attr_reader :expired,
                          :multiple,
                          :voted

    collection_attr_reader :options, Mastodon::PollOption

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
