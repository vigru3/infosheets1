require 'rails_helper'

RSpec.describe Clientmod::ClientsController, type: :controller do
  describe "clients#index action" do
    it "should return correct types" do
      get :index
      expect_status(200)
    end
  end

  describe "clients#new action" do
    it "should successfully show the form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "clients#create action" do
    it "should successfully create a new client in the database" do
      post :create, params: { client: { clientname: "RspecClient" } }
      expect(response).to redirect_to root_path

      client = Client.last
      expect(client.clientname).to eq('RspecClient')
    end
  end

  describe "clients#show action" do
    it "should successfully show the page if the client is found" do
      client = FactoryBot.create(:client)
      get :show, params: { id: client.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the gram is not found" do
      get :show, params: { id: 'NOTACLIENT' }
      expect(response).to have_http_status(:not_found)
    end

  end

end
