class FavoriteFacade
  def self.index(api_key)
    user = User.find_by(api_key: api_key)
    if user
      {json: FavoriteSerializer.new(user.favorites), status: 200}
    else
      {json: {errors: "invalid API key"}, status: 409}
    end
  end
end