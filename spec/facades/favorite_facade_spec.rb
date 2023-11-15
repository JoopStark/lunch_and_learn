require "rails_helper"

describe UserFacade do
  context "class methods" do
    describe "self.create" do
      it "creates a favorite and returns a hash" do
        user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: 111222333)
        params = {api_key: 111222333, country: "germany", recipe_link: "food.com", recipe_title: "yum"}

        favorite = FavoriteFacade.create(params)

        expect(favorite[:json]).to be_a Hash
        expect(favorite[:json][:success]).to eq("Favorite added successfully")
        expect(favorite[:status]).to eq(:created)
      end
    end

    describe "self.index" do
      it "creates a hash of the favorites for provided API key" do
        user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: 111222333)
          fav1 = Favorite.create!(user: user, country: "germany", recipe_link: "https://www.tastingtable.com/", recipe_title: "Yum", created_at: "2022-11-02T02:17:54.111Z")
          fav2 = Favorite.create!(user: user, country: "japan", recipe_link: "https://www.othertastingtable.com/", recipe_title: "Oishi", created_at: "2022-11-02T02:17:54.111Z")

        favorite = FavoriteFacade.index(111222333)

        expect(favorite).to be_a Hash
        expect(favorite[:json]).to be_a Object
        expect(favorite[:status]).to eq(200)
      end
    end
  end
end