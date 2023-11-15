require "rails_helper"

describe "Sessions requests" do
  it "users can login" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?')

    login_params = ({ email: 'dave@aol.com',
                    password: 'Password12?',
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[:id]).to be_a String
    expect(data[:attributes][:name]).to eq(user.name)
    expect(data[:attributes][:email]).to eq(user.email)
    expect(data[:attributes][:api_key]).to eq(user.api_key)
  end

  it "users cannot login with a bad password" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?')

    login_params = ({ email: 'dave@aol.com',
                    password: 'Password13?',
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_params)
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:errors]).to eq("Your credentials did not match our system")
  end

  it "users cannot login with a invalid email" do
    user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?')

    login_params = ({ email: 'dave',
                    password: 'Password12?',
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_params)
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:errors]).to eq("Your credentials did not match our system")
  end
end