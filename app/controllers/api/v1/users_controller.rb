class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all, code: 200, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, code: 200, status: :ok
  end

  def create
    user = User.new user_params

    if user.save
      render json: user, code: 201, status: :created
    else
      render json: user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :gender)
  end
end
