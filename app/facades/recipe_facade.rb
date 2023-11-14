class RecipeFacade
  def self.index(data)
    raw_recipes = if data
                    RecipeService.new
                                .recipes(data)
                  else
                    RecipeService.new
                                  .recipes(CountryService.new
                                                          .country)
                  end

     {json: RecipeSerializer.new(raw_recipes[:hits].map do |recipe|
                                        Recipe.new(recipe, data)
                                      end)}
  end
end