class Api::V1::FavoritesController < ApplicationController
  def create
    render FavoriteFacade.create(params)
  end

  def index
    render FavoriteFacade.index(params[:api_key])
  end
end