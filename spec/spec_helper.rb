# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start { add_filter '/test/' }

require_relative '../test/dummy/config/environment'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before(:suite) do
    ActiveRecord::Migration.maintain_test_schema!
  end
end
