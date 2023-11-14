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

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last
    expect(response).to be_successful
    expect(created_user.name).to eq(user_params[:name])
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.api_key).to be_a String

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[:id]).to be_a String
    expect(data[:attributes][:name]).to eq(user_params[:name])
    expect(data[:attributes][:email]).to eq(user_params[:email])
    expect(data[:attributes][:api_key].size).to eq(20)
  end

  it "users cannot create accounts with mismatch passwords" do
    user_params = ({
                    name: 'Dave',
                    email: 'dave@aol.com',
                    password: 'Password12?',
                    password_confirmation: 'nope'
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response.status).to eq(409)
    expect(response.body).to eq("[\"password_confirmation doesn't match Password\"]")
  end

  it "users cannot create accounts with multiple problems" do
    user_params = ({
                    name: nil,
                    email: 'dave@aol.com',
                    password: 'Password12?',
                    password_confirmation: 'nope'
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response.status).to eq(409)
    expect(response.body).to eq("[\"name can't be blank\",\"password_confirmation doesn't match Password\"]")
  end
end