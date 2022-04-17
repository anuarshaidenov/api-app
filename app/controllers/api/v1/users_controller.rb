class Api::V1::UsersController < ApplicationController
  def index
    render jsonapi: User.all
  end

  def show
    @user = User.find(params[:id])
    render jsonapi: @user
  end

  def create
    user = User.new user_params

    if user.save
      render jsonapi: user, code: '201', status: :created
    else
      render jsonapi_errors: user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render jsonapi: user, code: '200', status: :ok
    else
      render jsonapi_errors: user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render jsonapi: user, code: '200', status: :ok
    else
      render jsonapi_errors: user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :gender)
  end
end
