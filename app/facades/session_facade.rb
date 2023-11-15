class SessionFacade
  def self.create(params)
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      {json: UserSerializer.new(user), status: :created}
    else
      {json: {errors: "Your credentials did not match our system"}, status: 401}
    end
  end
end