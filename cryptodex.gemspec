# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptodex/version'

Gem::Specification.new do |spec|
  spec.name          = 'cryptodex'
  spec.version       = Cryptodex::VERSION
  spec.authors       = ['Pluto and Bacon']
  spec.email         = ['plutonbacon@dynosoft.org']
  spec.summary       = 'Pure Ruby implementations of cryptographic primitives.'
  spec.description   = 'Pure Ruby implementations of cryptographic primitives.'
  spec.homepage      = 'https://github.com/plutonbacon/cryptodex.git'
  spec.license       = 'ISC'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir['lib/**/*'] + %w( README.md LICENSE )

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Development only
  spec.add_development_dependency 'bundler',  '~> 1.11.2'
  spec.add_development_dependency 'rake',     '~> 10.5.0'
  spec.add_development_dependency 'rubocop',  '~> 0.37.2'
  spec.add_development_dependency 'rspec',    '~> 3.4.0'
  spec.add_development_dependency 'yard',     '~> 0.8.7.6'
end
