require "rails_helper"

describe "User requests" do
  it "users can create accounts" do
    user_params = ({
                    name: 'Dave',
                    email: 'dave@aol.com',
                    password: 'Password12?',
                    password_confirmation: 'Password12?'
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/books", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    expect(response).to be_successful
    expect(created_book.name).to eq(user_params[:name])
    expect(created_book.email).to eq(email_params[:email])
    expect(created_book.api_key).to be_a String

  end
end