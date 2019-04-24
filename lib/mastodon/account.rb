# frozen_string_literal: true

require_relative 'field'

module Mastodon
  class Account < Mastodon::Base
    NoBotRegex = /#?NoBot/i
    
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] username
    #   @return [String]
    # @!attribute [r] acct
    #   @return [String]
    # @!attribute [r] display_name
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] avatar
    #   @return [String]
    # @!attribute [r] avatar_static
    #   @return [String]
    # @!attribute [r] header
    #   @return [String]
    # @!attribute [r] header_static
    #   @return [String]
    # @!attribute [r] note
    #   @return [String]
    # @!attribute [r] followers_count
    #   @return [Integer]
    # @!attribute [r] following_count
    #   @return [Integer]
    # @!attribute [r] statuses_count
    #   @return [Integer]
    # @!attribute [r] created_at
    #   @return [String]
    # @!attribute [r] locked?
    #   @return [Boolean]
    # @!attribute [r] moved
    #   @return [Mastodon::Account]
    # @!attribute [r] fields
    #   @return [Mastodon::Collection<Mastodon::Field>]

    normal_attr_reader :id,
                       :username,
                       :acct,
                       :display_name,
                       :created_at,
                       :url,
                       :avatar,
                       :avatar_static,
                       :header,
                       :header_static,
                       :note,
                       :followers_count,
                       :following_count,
                       :statuses_count

    predicate_attr_reader :locked

    object_attr_reader :moved, Mastodon::Account

    collection_attr_reader :fields, Mastodon::Field

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end

    def no_bot?
      note =~ NoBotRegex ||
        fields.any? {|f| f.name =~ NoBotRegex || f.value =~ NoBotRegex}
    end
  end
end
