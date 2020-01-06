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
end
