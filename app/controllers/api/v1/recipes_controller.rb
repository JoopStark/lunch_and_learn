class Api::V1::RecipesController < ApplicationController
  def index
    render RecipeFacade.index(params[:country])
  end
end