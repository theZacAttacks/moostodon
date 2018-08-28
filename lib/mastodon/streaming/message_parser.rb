# frozen_string_literal: true

require_relative '../status'
require_relative '../streaming/deleted_status'

module Mastodon
  module Streaming
    class MessageParser
      MESSAGE_TYPES = {
        'update' => Status,
        'notification' => Notification,
        'delete' => DeletedStatus
      }.freeze

      def self.parse(type, data)
        klass = MESSAGE_TYPES[type]
        klass&.new(data)
      end
    end
  end
end
