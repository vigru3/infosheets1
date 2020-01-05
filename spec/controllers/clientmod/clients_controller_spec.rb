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
      get :show, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end

  end

  describe "clients#edit action" do
    it "should successfully show the form" do
      client = FactoryBot.create(:client)
      get :edit, params: { id: client.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the gram is not found" do
      get :edit, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "clients#update action" do
    it "should allow users to successfully update clients" do
      client = FactoryBot.create(:client, clientname: "Initial Value")
      patch :update, params: {id: client.id, client: { clientname: "Changed" } }
      expect(response).to redirect_to root_path
      client.reload
      expect(client.clientname).to eq "Changed"
    end

    it "should have http 404 error if the client cannot be found" do
      patch :update, params: { id: 'N/A', client: { clientname: "Changed" } }
      expect(response).to have_http_status(:not_found)
    end

    #it "should render the edit form with an http status of unprocessable_entity" do
    #  client = FactoryBot.create(:client, clientname: "Initial Value")
    #  patch :update, params: { id: client.id, client: { clientname: '' } }
    #  expect(response).to have_http_status(:unprocessable_entity)
    #  client.reload
    #  expect(client.clientname).to eq "Initial Value"
    #end
  end

  describe "clients#destroy action" do
    it "should allow a user to destroy clients" do
      client = FactoryBot.create(:client)
      delete :destroy, params: { id: client.id }
      expect(response).to redirect_to root_path
      client = Client.find_by_id(client.id)
      expect(client).to eq nil
    end

    it "should return a 404 message if we cannot find a client with the id that is specified" do
      delete :destroy, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
