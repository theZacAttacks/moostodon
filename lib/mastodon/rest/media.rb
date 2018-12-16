# frozen_string_literal: true

require_relative '../rest/utils'
require_relative '../media'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      # Upload a media file
      # @param file [File, StringIO, HTTP::FormData::File] file to
      #   upload. Will be converted to HTTP::FormData::File before upload
      # @param description [String] A text description of the image, to be
      #   along with the image.
      # @return [Mastodon::Media]
      def upload_media(file, description = nil)
        file = if file.is_a?(HTTP::FormData::File)
                 file
               else
                 HTTP::FormData::File.new(file)
               end
        payload = { file: file }
        payload[:description] = description unless description.nil?
        perform_request_with_object(:post, '/api/v1/media', payload,
                                    Mastodon::Media)
      end

      # Update a media description, can only be updated while it's not
      #   associated to a status
      # @param media_id [Integer] Id of the media, returned by upload_media
      # @param description [String] A text description of the image, to be
      #   along with the image.
      # @return [Mastodon::Media]
      def update_media_description(media_id, description)
        perform_request_with_object(:put, "/api/v1/media/#{media_id}",
                                    { description: description },
                                    Mastodon::Media)
      end
      
      # Update a media focal point, can only be updated while it's not
      #   associated to a status
      # @param media_id [Integer] Id of the media, returned by upload_media
      # @param focal_x [Float] X position of the focus
      # @param focal_y [Float] Y position of the focus
      # @return [Mastodon::Media]
      def update_media_focus(media_id, focus_x, focus_y)
        perform_request_with_object(:put, "/api/v1/media/#{media_id}",
                                    { focus: "#{focus_x},#{focus_y}" },
                                    Mastodon::Media)
      end
    end
  end
end
