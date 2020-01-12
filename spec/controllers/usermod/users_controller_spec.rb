require 'rails_helper'

RSpec.describe Usermod::UsersController, type: :controller do
  describe "users#index action" do
    it "should list all users with json" do
      get :index
      expect_status(200)
    end
  end
  describe "users#new action" do
    it "should successfully show the form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "users#create action" do
    it "should successfully create a new user in the database" do
      post :create, params: { user: { email: "rspec@test.com", password: "password", password_confirmation: "password", type: "Sa", fname: "First", lname: "Last"}}
      expect(response).to redirect_to root_path

      user = User.last
      expect(user.email).to eq('rspec@test.com')
    end
  end

  describe "users#show action" do
    it "should successfully show the page if the user is found" do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the user is not found" do
      get :show, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "users#edit action" do
    it "should successfully show the edit form" do
      user = FactoryBot.create(:user)
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the user is not found" do
      get :edit, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "users#update action" do
    it "should allow users to successfully update users" do
      user = FactoryBot.create(:user, email: "1@1.com", type: "Sa", fname: "first", lname: "last")
      patch :update, params: {id: user.id, user: { email: "2@2.com", type: "Admin", fname: "tsrif", lname: "tsal" } }
      expect(response).to redirect_to root_path
      user.reload
      expect(user.email).to eq "2@2.com"
    end

    it "should have http 404 error if the user cannot be found" do
      patch :update, params: { id: 'N/A', user: { email: "2@2.com" } }
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

  describe "users#destroy action" do
    it "should allow a user to destroy users" do
      user = FactoryBot.create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to root_path
      user = User.find_by_id(user.id)
      expect(user).to eq nil
    end

    it "should return a 404 message if we cannot find a user with the id that is specified" do
      delete :destroy, params: { id: 'N/A' }
      expect(response).to have_http_status(:not_found)
    end
  end

end