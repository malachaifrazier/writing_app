ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rspec/core'
require 'database_cleaner'
# Add additional requires below this line. Rails is not loaded until this point!
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

SimpleCov.start 'rails'
require 'bundler/setup'
::Bundler.require(:default, :test)

require 'shoulda/matchers'
::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.include FactoryGirl::Syntax::Methods
  config.extend ControllerMacros, type: :controller
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
ActiveRecord::Migration.maintain_test_schema!
