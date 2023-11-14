class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    favorite = Favorite.create(user: user, country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title])

    if favorite.save
      render json: {success: "Favorite added successfully"}, status: :created
    else
      render json: error_response(favorite.errors) , status: 409
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title) 
  end

  def error_response(errors)
    if errors.messages.keys.include? (:user)
      {errors: "invalid API key"}
    else
      {errors: "missing data"}
    end
  end
end