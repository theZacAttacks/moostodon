# frozen_string_literal: true

require_relative 'statuses'
require_relative 'accounts'
require_relative 'timelines'
require_relative 'notifications'
require_relative 'search'
require_relative 'relationships'
require_relative 'media'
require_relative 'suggestions'
require_relative 'apps'
require_relative 'instances'

module Mastodon
  module REST
    module API
      include Mastodon::REST::Statuses
      include Mastodon::REST::Accounts
      include Mastodon::REST::Timelines
      include Mastodon::REST::Notifications
      include Mastodon::REST::Search
      include Mastodon::REST::Relationships
      include Mastodon::REST::Media
      include Mastodon::REST::Suggestions
      include Mastodon::REST::Apps
      include Mastodon::REST::Instances
    end
  end
end
