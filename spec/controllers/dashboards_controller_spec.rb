require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe "dashboard#show action" do
    it "should successfully show the page" do
      get :show
      expect(response).to have_http_status(:success)
    end  
  end
end
