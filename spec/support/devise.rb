module Devise::RoutingTestHelpers
  attr_accessor :request

  def mock_warden_for_route_tests!
    warden = double
    allow_any_instance_of(ActionDispatch::Request).to receive(:env).
      and_wrap_original { |orig, *args|
      env = orig.call(*args)
      env['warden'] = warden
      env
    }
    allow(warden).to receive(:authenticate!).and_return(true)
    allow(warden).to receive(:authenticate?).and_return(true)
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :routing

  config.include Devise::RoutingTestHelpers, type: :routing

  config.before(:each, type: :routing) do
    mock_warden_for_route_tests!
  end
end