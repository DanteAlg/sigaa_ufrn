require 'bundler/setup'
require 'json'
require 'sigaa_ufrn'
Bundler.require(:development)

require 'support/vcr'

SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
