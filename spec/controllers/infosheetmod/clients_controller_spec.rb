require 'rails_helper'

RSpec.describe Infosheetmod::ClientsController, type: :controller do
  describe "clients#index action" do
    it "should return correct types" do
      get :index
      expect_status(200)
    end
  end
end
