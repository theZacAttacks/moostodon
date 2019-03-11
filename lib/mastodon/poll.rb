# frozen_string_literal: true

require_relative 'polloption'

module Mastodon
  class Poll < Mastodon::Base

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
