require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  def setup
    allow(controller).to receive(:current_user) { user }
    @request.session[:verified]  = true
    @request.env["HTTP_REFERER"] = 'http://test.host/'
  end

  before(:each) do
    setup
    sign_in user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
