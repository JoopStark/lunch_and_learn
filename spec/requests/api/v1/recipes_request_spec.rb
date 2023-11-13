require 'rails_helper'

describe "Request recipes" do
  it "sends a list of recipes", :vcr do
  #  make_api_request
    
    get '/api/v1/recipes?country=germany'

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    recipes[:data].each do |recipe|
      expect(recipe[:id]).to eq(nil)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes][:id]).to eq(nil)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end

  it "sends a list of recipes from random country if no country submitted", :vcr do
    make_api_request

    get '/api/v1/recipes'

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    recipes[:data].each do |recipe|
      expect(recipe[:id]).to eq(nil)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes][:id]).to eq(nil)
      expect(recipe[:attributes][:title]).to be_a(String)
      expect(recipe[:attributes][:url]).to be_a(String)
      expect(recipe[:attributes][:image]).to be_a(String)
    end
  end

  it "sends empty hash for no data", :vcr do
    # make_api_request

    get '/api/v1/recipes?country=notacountry'

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes[:data]).to eq([])
  end

  it "sends empty hash for empty string", :vcr do
    # make_api_request

    get '/api/v1/recipes?country= '

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes[:data]).to eq([])
  end
end