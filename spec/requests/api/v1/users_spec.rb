require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET api/v1/users" do
    it "returns list of available users" do
      create(:user)
      total_users = User.all.count
      get api_v1_users_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['data'].count).to eq(total_users)  
    end
  end

  describe 'GET api/v1/users/:id' do
    it "returns http success" do
      user = create(:user)
      get api_v1_user_path id: user.id
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data']['attributes']).to include({ 'email' => user.email })
    end
  end

  describe 'POST /api/v1/users/' do
    it "creates a new user" do
      total_users = User.all.count
      request_body = {
        user: {
          fullname: 'New User',
          email: 'new@example.com',
          password: 'djosdjodj'
        }
      }

      post api_v1_users_path, params: request_body
      expect(response).to have_http_status(201)
      expect(User.all.count).to eq(total_users + 1)
    end
  end

  describe "PATCH api/v1/change_password" do
    it "changes user password" do
      user = create(:user)
      request_body = {
        user: { password: 'new_password' }
      }
      token = JsonWebToken.encode(user_id: user.id)
      patch api_v1_change_password_path, params: request_body, headers: {'Authorization': token}
      expect(response).to have_http_status(200)
    end

    it "does not change user password for invalid token" do
      user = create(:user)
      request_body = {
        user: { password: 'new_password' }
      }
      token = '2339dj'
      patch api_v1_change_password_path, params: request_body, headers: {'Authorization': token}
      expect(response).to have_http_status(401)
    end
  end

end
