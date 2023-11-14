require "rails_helper"

RSpec.describe Recipe do
  it "takes a hash and makes a ruby object" do
    country = "germany"
    recipe_data =
    {:recipe=>
  {:uri=>"http://www.edamam.com/ontologies/edamam.owl#recipe_0ff324329d2fcffb7dab09ea8e948605",
   :label=>"Cinnamon Stars: Zimtsterne (Germany)",
   :image=>"https://edamam-product-images.s3.amazonaws.com"}}

    recipe = Recipe.new(recipe_data, country)

    expect(recipe).to be_a(Recipe)
    expect(recipe.country).to eq("germany")
    expect(recipe.title).to eq("Cinnamon Stars: Zimtsterne (Germany)")
    expect(recipe.url).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_0ff324329d2fcffb7dab09ea8e948605")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com")
    expect(recipe.id).to eq(nil)
  end
end