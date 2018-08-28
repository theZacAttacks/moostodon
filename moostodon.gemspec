# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/mastodon/version'

Gem::Specification.new do |spec|
  spec.name          = 'moostodon'
  spec.description   = 'A ruby interface to the Mastodon API'
  spec.homepage      = 'https://github.com/maxine-red/moostodon'
  spec.email         = 'maxine@furfind.net'
  spec.authors       = ['Maxine Michalski']
  spec.summary       = 'A ruby interface to the Mastodon API, based on'\
                       ' mastodon-api.'
  spec.licenses      = %w[MIT]
  spec.files         = %w[moostodon.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]
  spec.version       = Mastodon::Version

  spec.add_dependency 'addressable', '~> 2.5'
  spec.add_dependency 'buftok', '~> 0'
  spec.add_dependency 'http', '~> 3.0'
  spec.add_dependency 'oj', '~> 3.3'

  spec.add_development_dependency 'bundler', '~> 1.0'
end
