# frozen_string_literal: true

require_relative 'account'
require_relative 'status'

module Mastodon
  class Results < Mastodon::Base
    # @!attribute [r] accounts
    #   @return [Mastodon::Collection<Mastodon::Account>]
    # @!attribute [r] statuses
    #   @return [Mastodon::Collection<Mastodon::Status>]
    # @!attribute [r] hashtags
    #   @return [Mastodon::Collection<String>]

    collection_attr_reader :accounts, Mastodon::Account
    collection_attr_reader :statuses, Mastodon::Status
    collection_attr_reader :hashtags, String
  end
end
