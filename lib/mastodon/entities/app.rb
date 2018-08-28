# frozen_string_literal: true

module Mastodon
  module Entities
    # The application a toot was sent by.
    class App < Mastodon::Base
      # @!attribute [r] name
      #   @return [String]
      # @!attribute [r] website
      #   @return [String]

      normal_attr_reader :name, :website
    end
  end
end
