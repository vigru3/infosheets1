require 'rails_helper'

RSpec.describe Usermod::UsersController, type: :controller do
  describe "users#new action" do
    it "should successfully show the form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "users#create action" do
    it "should successfully create a new user in the database" do
      post :create, params: { user: { email: "rspec@test.com", password: "password", password_confirmation: "password", user_type: "Sa", fname: "First", lname: "Last"}}
      expect(response).to redirect_to root_path

      user = User.last
      expect(user.email).to eq('rspec@test.com')
    end
  end

end