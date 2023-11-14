class Api::V1::SessionsController < ApplicationController
  def create
    # user = User.find_by(email: params[:email])
    # if user&.authenticate(params[:password])
    #   render json: UserSerializer.new(user), status: :created
    # else
    #   render json: {errors: "Your credentials did not match our system"}, status: 401
    # end

    render SessionFacade.create(params)
  end
end