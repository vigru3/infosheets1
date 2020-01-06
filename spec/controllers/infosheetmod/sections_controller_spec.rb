require 'rails_helper'

RSpec.describe Infosheetmod::SectionsController, type: :controller do
  describe "sections#index action" do
    it "should list all sections in json" do
      client = FactoryBot.create(:client)
      get :index, params: { client_id: client.id }
      expect_status(200)
    end
  end

  describe "sections#show action" do
    it "should successfully show the page if the section is found" do
      section = FactoryBot.create(:section)
      get :show, params: { id: section.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the section is not found" do
      get :show, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "sections#new action" do
    it "should successfully show the form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "sections#create action" do
    it "should successfully create a new section in the database" do
      post :create, params: { section: { sectionname: "RspecSection" } }
      expect(response).to redirect_to root_path

      section = Section.last
      expect(section.sectionname).to eq('RspecSection')
    end
  end

  describe "sections#edit action" do
    it "should successfully show the edit form" do
      section = FactoryBot.create(:section)
      get :edit, params: { id: section.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the section is not found" do
      get :edit, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "sections#update action" do
    it "should allow users to successfully update sections" do
      section = FactoryBot.create(:section, sectionname: "Initial Value")
      patch :update, params: {id: section.id, section: { sectionname: "Changed" } }
      expect(response).to redirect_to root_path
      section.reload
      expect(section.sectionname).to eq "Changed"
    end

    it "should have http 404 error if the section cannot be found" do
      patch :update, params: { id: 'N/A', section: { sectionname: "Changed" } }
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

  describe "sections#destroy action" do
    it "should allow a user to destroy sections" do
      section = FactoryBot.create(:section)
      delete :destroy, params: { id: section.id }
      expect(response).to redirect_to root_path
      section = Section.find_by_id(section.id)
      expect(section).to eq nil
    end

    it "should return a 404 message if we cannot find a client with the id that is specified" do
      delete :destroy, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
