# frozen_string_literal: true

require_relative '../client'
require_relative 'api'

module Mastodon
  module REST
    # Main interaction class for the REST API.
    class Client < Mastodon::Client
      include Mastodon::REST::API
    end
  end
end
