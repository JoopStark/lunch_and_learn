class UserFacade
  def self.create(params)
    user = User.new(user_params(params))
    if user.save
      {json: UserSerializer.new(user), status: :created}
    else
      {json: ErrorSerializer.new(user.errors.messages).serialize_json , status: 409}
    end
  end

  private

  def self.user_params(params)
    params.permit(:name, :email, :password, :password_confirmation) 
  end

end