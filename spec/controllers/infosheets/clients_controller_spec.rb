require 'rails_helper'

RSpec.describe Infosheets::ClientsController, type: :controller do
  describe "clients#index action" do
    it "should list all clients with json" do
      get :index
      expect_status(200)
    end
  end

  describe "clients#show action" do
    it "should successfully show the page if the client is found" do
      client = FactoryBot.create(:client)
      get :show, params: { id: client.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the client is not found" do
      get :show, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
