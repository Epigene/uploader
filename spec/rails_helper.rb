require 'simplecov'

SimpleCov.start 'rails' do
  add_filter '/spec/'

  add_group 'Controllers' do |file|# 'app/controllers'
    file.filename[%r'/app/controllers'].present? && file.filename[%r'/app/controllers/concerns'].blank?
  end
  add_group 'Controller Concerns' do |file|#, 'app/controllers/concerns'
    file.filename[%r'/app/controllers/concerns'].present?
  end

  add_group 'Lib' do |file| #, 'app/lib'
    file.filename[%r'/app/lib'].present?
  end

  add_group 'Models' do |file| #, 'app/models'
    file.filename[%r'/app/models'].present? && file.filename[%r'/app/models/concerns'].blank?
  end
  add_group 'Model Concerns' do |file|#, 'app/controllers/concerns'
    file.filename[%r'/app/models/concerns'].present?
  end

  add_group 'Helpers', 'app/helpers'
  add_group 'App Code', 'app/'
  add_group 'Jobs', 'app/jobs'
  add_filter 'app/views'
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation#, {except: %w[widgets]}
DatabaseCleaner.clean

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
