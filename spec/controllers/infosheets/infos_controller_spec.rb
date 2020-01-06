require 'rails_helper'

RSpec.describe Infosheets::InfosController, type: :controller do
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
end
