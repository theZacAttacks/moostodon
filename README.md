Mastodon API Ruby Gem
=====================

[![Gem Version](http://img.shields.io/gem/v/moostodon.svg)][gem]
[![Build Status](http://img.shields.io/travis/maxine-red/moostodon.svg)][travis]
![Github Release Date](https://img.shields.io/github/release-data/maxine-red/moostodon.svg)

[gem]: https://rubygems.org/gems/moostodon
[travis]: https://travis-ci.org/maxine-red/moostodon

A ruby interface for the [Mastodon](https://github.com/tootsuite/mastodon) API.

## Installation

    gem install moostodon

or

    gem 'moostodon', require: 'moostodon'

## Documentation

All the documentation is available on [RubyDoc](http://www.rubydoc.info/gems/moostodon/Mastodon/REST/API).

This gem is meant as a plug-and-play replacement for [mastodon-api](https://github.com/tootsuite/mastodon-api).

## Usage

Assuming that you already have an access token for a user on a given Mastodon instance:

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: 'your_access_token')

If you need to get an access token, you must first ensure that you have the client ID and client secret for your app on the given Mastodon instance (you should save those for future calls):

    client.create_app('My Ruby App', 'http://mywebsite.com/callback')

You can then use the client ID and secret in a standard OAuth 2 authorization flow.
