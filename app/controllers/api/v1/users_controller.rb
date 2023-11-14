class Api::V1::UserController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      binding.pry
      render json: {}, 
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation) 
  end
end