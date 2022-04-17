class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all, code: 200, status: :ok
  end

  def show
  end

  def create
  end

  def update
  end

  def delete
  end
end
