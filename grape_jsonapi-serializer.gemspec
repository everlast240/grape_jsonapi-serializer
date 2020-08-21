# frozen_string_literal: true

require File.expand_path('../lib/grape_jsonapi-serializer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Borislav Dimitrov', 'Emmanuel Cousin']
  gem.email         = ['everlast240@gmail.com', 'emmanuel_cousin@hotmail.fr']
  gem.summary       = 'Use jsonapi-serializer with Grape'
  gem.description   = 'Provides a Formatter for the Grape API DSL to emit objects serialized with jsonapi-serializer.'
  gem.homepage      = 'https://github.com/everlast240/grape_jsonapi-serializer'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  gem.name          = 'grape_jsonapi-serializer'
  gem.require_paths = ['lib']
  gem.version       = Grape::JsonapiSerializer::VERSION
  gem.licenses      = ['MIT']

  gem.add_dependency 'grape', '~> 1.4'
  gem.add_dependency 'jsonapi-serializer', '~> 2.0.0'

  gem.add_development_dependency 'rspec', '~> 3.9'
  gem.add_development_dependency 'activerecord', '~> 6.0.3.2'
  gem.add_development_dependency 'pry'
end
