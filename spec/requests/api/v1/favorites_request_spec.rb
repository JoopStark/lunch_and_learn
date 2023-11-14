require "rails_helper"

describe "Favoritess requests" do
  it "users can create favorite" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: '111222333')

    favorite_params = ({
      api_key: "111222333",
      country: "thailand",
      recipe_link: "https://www.tastingtable.com/food",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    created_favorite = Favorite.last
    expect(response).to be_successful
    expect(created_favorite.country).to eq(favorite_params[:country])
    expect(created_favorite.recipe_link).to eq(favorite_params[:recipe_link])
    expect(created_favorite.recipe_title).to eq(favorite_params[:recipe_title])

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:success]).to eq("Favorite added successfully")
  end

  it "users cannot create favorite with invalid API key" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: '111222333')

    favorite_params = ({
      api_key: "nope",
      country: "thailand",
      recipe_link: "https://www.tastingtable.com/food",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response.status).to eq(409)
    expect(response.body).to eq("{\"errors\":\"invalid API key\"}")
  end

  it "users cannot create favorite with invalid API key" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: '111222333')

    favorite_params = ({
      api_key: "111222333",
      country: "thailand",
      recipe_link: "https://www.tastingtable.com/food",
      recipe_title: nil
    })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)

    expect(response.status).to eq(409)
    expect(response.body).to eq("{\"errors\":\"missing data\"}")
  end
end