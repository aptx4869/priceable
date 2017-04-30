# frozen_string_literal: true
require File.expand_path('../lib/priceable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Will Cosgrove']
  gem.email         = ['will@willcosgrove.com']
  gem.description   = 'Super simple way to store prices'
  gem.summary       = 'Quit storing prices the stupid way.  Get Priceable!'
  gem.homepage      = 'http://github.com/willcosgrove/priceable'

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'priceable'
  gem.require_paths = ['lib']
  gem.version       = Priceable::VERSION

  gem.add_dependency 'activerecord', '~> 5.1.0'
  gem.add_development_dependency('rails')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('sqlite3')
  gem.add_development_dependency('coveralls')
  gem.add_development_dependency('simplecov')
end
