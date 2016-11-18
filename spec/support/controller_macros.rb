module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.env["HTTP_ACCEPT"] = "application/json"
      # user = FactoryGirl.create(:user)
      sign_in user
    end
  end
end
