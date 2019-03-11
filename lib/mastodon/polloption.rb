# frozen_string_literal: true

module Mastodon
  class PollOption < Mastodon::Base
    normal_attr_reader :title,
                       :votes_count
  end
end
