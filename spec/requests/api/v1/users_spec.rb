require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    it "returns list of available users" do
      create(:user)
      total_users = User.all.count
      get api_v1_users_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq(total_users)  
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/api/v1/users/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
