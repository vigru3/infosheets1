require 'rails_helper'
#require 'airborne'

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

end
