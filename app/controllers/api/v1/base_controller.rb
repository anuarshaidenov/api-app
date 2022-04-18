# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      def authenticate_request!
        @decoded = JsonWebToken.decode(auth_token).deep_symbolize_keys
        set_current_user
      rescue JWT::ExpiredSignature
        render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
      rescue JWT::DecodeError => e
        render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
      end

      def set_current_user
        if @decoded[:user_id].present?
          @current_user = User.find(@decoded[:user_id])
        end
      end

      def auth_token
        @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
      end
    end
  end
end
