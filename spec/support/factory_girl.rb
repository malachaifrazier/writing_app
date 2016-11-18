RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods

  config.before(:all) do
    FactoryGirl.reload
  end

  # config.before(:suite) do
  #   FactoryGirl.find_definitions
  # end
end
