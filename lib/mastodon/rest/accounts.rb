# frozen_string_literal: true

require_relative '../rest/utils'
require_relative '../account'
require_relative '../relationship'

module Mastodon
  module REST
    module Accounts
      include Mastodon::REST::Utils

      # Retrieve account of authenticated user
      # @return [Mastodon::Account]
      def verify_credentials
        perform_request_with_object(:get, '/api/v1/accounts/verify_credentials',
                                    {}, Mastodon::Account)
      end

      # Update authenticated account attributes
      # @param options [Hash]
      # @option options display_name [String] The name to display in the
      #   user's profile
      # @option options note [String] A new biography for the user
      # @option options avatar [String] A base64 encoded image to display as
      #   the user's avatar
      # @option options header [String] A base64 encoded image to display as
      #   the user's header image
      # @option options bot [Boolean] A boolean indicating if this account
      #   is automated

      # @return [Mastodon::Account]
      def update_credentials(opts = {})
        opts[:fields] and opts.delete(:fields).each_with_index { |f, i|
          opts["fields_attributes[#{i}][name]"] = f[:name]
          opts["fields_attributes[#{i}][value]"] = f[:value]
        }
        perform_request_with_object(:patch,
                                    '/api/v1/accounts/update_credentials',
                                    opts, Mastodon::Account)
      end

      # Retrieve account
      # @param id [Integer]
      # @return [Mastodon::Account]
      def account(id)
        perform_request_with_object(:get, "/api/v1/accounts/#{id}", {},
                                    Mastodon::Account)
      end

      # Get a list of followers
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def followers(id)
        perform_request_with_collection(:get,
                                        "/api/v1/accounts/#{id}/followers",
                                        {}, Mastodon::Account)
      end

      # Get a list of followed accounts
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def following(id)
        perform_request_with_collection(:get,
                                        "/api/v1/accounts/#{id}/following",
                                        {}, Mastodon::Account)
      end

      # Follow a remote user
      # @param uri [String] The URI of the remote user, in the format of
      #   username@domain
      # @return [Mastodon::Account]
      def follow_by_uri(uri)
        perform_request_with_object(:post,
                                    '/api/v1/follows', { uri: uri },
                                    Mastodon::Account)
      end


      # Get account endorsements
      # @return [Mastodon::Collection<Mastodon::Account>]
      def endorsements
        perform_request_with_collection(:get, '/api/v1/endorsements',
                                        {}, Mastodon::Account)
      end

      # Add an endorsement
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def add_endorsement(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/pin",
                                    {}, Mastodon::Relationship)
      end

      # Remove an endorsement
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def remove_endorsement(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/unpin",
                                    {}, Mastodon::Relationship)
      end
      # Get user mutes
      # @return [Mastodon::Collection<Mastodon::Account>]
      def mutes
        perform_request_with_collection(:get, '/api/v1/mutes',
                                        {}, Mastodon::Account)
      end

      # Get user blocks
      # @param options [Hash]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def blocks(options = {})
        perform_request_with_collection(:get, '/api/v1/blocks',
                                        options, Mastodon::Account)
      end
      # Report an account
      # @param id [Integer]
      # @param options [Hash]
      # @option options :status_ids [Array<Integer>]
      # @option options :comment [String]
      def report(id, options = {})
        options[:account_id] = id
        !perform_request(:post, '/api/v1/reports', options).nil?
      end
      # Gets follow requests
      # @param options [Hash]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def follow_requests(options = {})
        perform_request_with_collection(:get, '/api/v1/follow_requests',
                                        options, Mastodon::Account)
      end

      # Accept a follow request
      # @param id [Integer]
      # @return [Boolean]
      def accept_follow_request(id)
        !perform_request(:post, "/api/v1/follow_requests/#{id}/authorize").nil?
      end

      # Reject follow request
      # @param id [Integer]
      # @return [Boolean]
      def reject_follow_request(id)
        !perform_request(:post, "/api/v1/follow_requests/#{id}/reject").nil?
      end
    end
  end
end
