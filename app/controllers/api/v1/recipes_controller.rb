class Api::V1::RecipesController < ApplicationController
  def index
    # if params[:country]
    #   raw_recipes = RecipeService.new
    #                              .recipes(params[:country])
    # else
    #   raw_recipes = RecipeService.new
    #                              .recipes(CountryService.new
    #                                                     .country)
    # end

    # render json: RecipeSerializer.new(raw_recipes[:hits].map do |recipe|
    #                                     Recipe.new(recipe, params[:country])
    #                                   end)
    render RecipeFacade.index(params[:country])
  end
end