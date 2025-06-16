require 'spec_helper'
require 'vcr'
require 'simplecov'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }


begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true

  config.filter_rails_from_backtrace!
end
# Configure Shoulda Matchers to use RSpec and Rails
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Configure VCR to record HTTP interactions
VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr"
  config.hook_into :webmock
end

# Configure SimpleCov to track code coverage
SimpleCov.start
SimpleCov.minimum_coverage 90
