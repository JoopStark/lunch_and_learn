require 'rails_helper'

describe "Request tourist spot request" do
  it "sends a list of tourist spots", :vcr do
  #  make_api_request
    
    get '/api/v1/tourist_sites?country=France'

    expect(response).to be_successful

    tourist_sites = JSON.parse(response.body, symbolize_names: true)

    tourist_sites[:data].each do |site|
      # binding.pry
      expect(site[:id]).to eq(nil)
      expect(site[:type]).to eq("tourist_site")
      expect(site[:attributes]).to be_a(Hash)
      expect(site[:attributes][:id]).to eq(nil)
      expect(site[:attributes][:name]).to be_a(String)
      expect(site[:attributes][:address]).to be_a(String)
      expect(site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "sends a list of tourist spots(Latvia)", :vcr do
  #  make_api_request
    
    get '/api/v1/tourist_sites?country=Latvia'

    expect(response).to be_successful

    tourist_sites = JSON.parse(response.body, symbolize_names: true)

    tourist_sites[:data].each do |site|
      # binding.pry
      expect(site[:id]).to eq(nil)
      expect(site[:type]).to eq("tourist_site")
      expect(site[:attributes]).to be_a(Hash)
      expect(site[:attributes][:id]).to eq(nil)
      expect(site[:attributes][:name]).to be_a(String)
      expect(site[:attributes][:address]).to be_a(String)
      expect(site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "sends a list of tourist spots(New_Zealand)", :vcr do
  #  make_api_request
    
    get '/api/v1/tourist_sites?country=new zealand'

    expect(response).to be_successful

    tourist_sites = JSON.parse(response.body, symbolize_names: true)

    tourist_sites[:data].each do |site|
      # binding.pry
      expect(site[:id]).to eq(nil)
      expect(site[:type]).to eq("tourist_site")
      expect(site[:attributes]).to be_a(Hash)
      expect(site[:attributes][:id]).to eq(nil)
      expect(site[:attributes][:name]).to be_a(String)
      expect(site[:attributes][:address]).to be_a(String)
      expect(site[:attributes][:place_id]).to be_a(String)
    end
  end

  it "(sad path)sends a list of tourist spots Antarctica", :vcr do
  #  make_api_request
    
    get '/api/v1/tourist_sites?country=Antarctica'

    expect(response).to be_successful
    
    expect(response.status).to eq(204)
  end
end