require "rails_helper"

describe "Favorites requests" do
  describe "favorites#create" do
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
  
  describe "favorites#index" do
    it "user can see their favorites" do
      user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: '111222333')
        fav1 = Favorite.create!(user: user, country: "germany", recipe_link: "https://www.tastingtable.com/", recipe_title: "Yum", created_at: "2022-11-02T02:17:54.111Z")
        fav2 = Favorite.create!(user: user, country: "japan", recipe_link: "https://www.othertastingtable.com/", recipe_title: "Oishi", created_at: "2022-11-02T02:17:54.111Z")

      get "/api/v1/favorites?api_key=111222333"

      expect(response).to be_successful

      favorites = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(favorites[0][:id]).to be_a(String)
      expect(favorites[0][:attributes]).to be_a(Hash)

      expect(favorites[0][:attributes][:recipe_title]).to eq(fav1.recipe_title)
      expect(favorites[0][:attributes][:recipe_link]).to eq(fav1.recipe_link)
      expect(favorites[0][:attributes][:country]).to eq(fav1.country)
      expect(favorites[0][:attributes][:created_at].to_s).to eq("2022-11-02T02:17:54.111Z")

      expect(favorites[1][:attributes][:recipe_title]).to eq(fav2.recipe_title)
      expect(favorites[1][:attributes][:recipe_link]).to eq(fav2.recipe_link)
      expect(favorites[1][:attributes][:country]).to eq(fav2.country)
      expect(favorites[1][:attributes][:created_at].to_s).to eq("2022-11-02T02:17:54.111Z")
    end

    it "user cannot see their favorites if their API key is bad" do
      user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: '111222333')
        fav1 = Favorite.create!(user: user, country: "germany", recipe_link: "https://www.tastingtable.com/", recipe_title: "Yum", created_at: "2022-11-02T02:17:54.111Z")
        fav2 = Favorite.create!(user: user, country: "japan", recipe_link: "https://www.othertastingtable.com/", recipe_title: "Oishi", created_at: "2022-11-02T02:17:54.111Z")

      get "/api/v1/favorites?api_key=3"

      expect(response.status).to eq(409)

      favorites = JSON.parse(response.body, symbolize_names: true)
      
      expect(favorites).to eq({:errors=>"invalid API key"})
    end
  end
end