require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'POST /api/v1/sessions' do
    it 'lets user login with correct credentials' do
      user = create(:user)
      request_body = {
        user: { email: user.email, password: user.password }
      }
      post api_v1_login_path, params: request_body
      expect(response).to have_http_status(200)
    end

    it "expects auth token in response" do
      user = create(:user)
      request_body = {
        user: { email: user.email, password: user.password}
      }

      post api_v1_login_path, params: request_body
      result = JSON.parse(response.body)
      token = JsonWebToken.encode(user_id: user.id)
      expect(result["data"]["attributes"]["auth_token"]).to eq(token)
      expect(response).to have_http_status(200)
    end
  end
end