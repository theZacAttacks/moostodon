# frozen_string_literal: true

require 'mastodon/client'
require 'mastodon/rest/api'

module Mastodon
  module REST
    # Main interaction class for the REST API.
    class Client < Mastodon::Client
      include Mastodon::REST::API
    end
  end
end
