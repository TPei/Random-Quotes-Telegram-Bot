ENV['RACK_ENV'] = 'test'

require 'rack/test'

# allow RSpec doubles in all contracts
RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:each) do
  end

  #config.around(:each, :db) do |example|
    #Api::DB.transaction(rollback: :always, auto_savepoint: true) do
      #example.run
    #end
  #end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
