# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mastodon/version'

Gem::Specification.new do |spec|
  spec.name          = 'moostodon'
  spec.description   = 'A ruby interface to the Mastodon API'
  spec.homepage      = 'https://github.com/tootsuite/mastodon-api'
  spec.email         = 'eugen@zeonfederated.com'
  spec.authors       = ['Eugen Rochko', 'Maxine Michalski']
  spec.summary       = spec.description
  spec.licenses      = %w[MIT]
  spec.files         = %w[mastodon.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]
  spec.version       = Mastodon::Version

  spec.add_dependency 'addressable', '~> 2.5'
  spec.add_dependency 'buftok'
  spec.add_dependency 'http', '~> 3.0'
  spec.add_dependency 'oj', '~> 3.3'

  spec.add_development_dependency 'bundler', '~> 1.0'
end
