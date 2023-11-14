class FavoriteFacade
  def self.index(api_key)
    user = User.find_by(api_key: api_key)
    if user
      {json: FavoriteSerializer.new(user.favorites), status: 200}
    else
      {json: {errors: "invalid API key"}, status: 409}
    end
  end

  def self.create(params)
    user = User.find_by(api_key: params[:api_key])
    favorite = Favorite.create(user: user, country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title])

    if favorite.save
      {json: {success: "Favorite added successfully"}, status: :created}
    else
      {json: error_response(favorite.errors) , status: 409}
    end
  end

  private

  def self.error_response(errors)
    if errors.messages.keys.include? (:user)
      {errors: "invalid API key"}
    else
      {errors: "missing data"}
    end
  end
end