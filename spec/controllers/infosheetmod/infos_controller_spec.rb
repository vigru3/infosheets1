require 'rails_helper'

RSpec.describe Infosheetmod::InfosController, type: :controller do
  describe "infos#index action" do
    it "should list all infos in json" do
      section = FactoryBot.create(:section)
      get :index, params: { section_id: section.id }
      expect_status(200)
    end
  end

  describe "infos#show action" do
    it "should successfully show the page if the info is found" do
      info = FactoryBot.create(:info)
      get :show, params: { id: info.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the info is not found" do
      get :show, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "infos#new action" do
    it "should successfully show the form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "infos#create action" do
    it "should successfully create a new info in the database" do
      post :create, params: { info: { infoname: "RspecInfo" } }
      expect(response).to redirect_to root_path

      info = Info.last
      expect(info.infoname).to eq('RspecInfo')
    end
  end

  describe "infos#edit action" do
    it "should successfully show the edit form" do
      info = FactoryBot.create(:info)
      get :edit, params: { id: info.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the info is not found" do
      get :edit, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "infos#update action" do
    it "should allow users to successfully update infos" do
      info = FactoryBot.create(:info, infoname: "Initial Value")
      patch :update, params: {id: info.id, info: { infoname: "Changed" } }
      expect(response).to redirect_to root_path
      info.reload
      expect(info.infoname).to eq "Changed"
    end

    it "should have http 404 error if the info cannot be found" do
      patch :update, params: { id: 'N/A', info: { infoname: "Changed" } }
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

  describe "infos#destroy action" do
    it "should allow a user to destroy infos" do
      info = FactoryBot.create(:info)
      delete :destroy, params: { id: info.id }
      expect(response).to redirect_to root_path
      info = Info.find_by_id(info.id)
      expect(info).to eq nil
    end

    it "should return a 404 message if we cannot find a info with the id that is specified" do
      delete :destroy, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
