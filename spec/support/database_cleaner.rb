RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
