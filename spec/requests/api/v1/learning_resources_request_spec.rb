require 'rails_helper'

describe "Request tourist spot request" do
  it "sends a list of tourist spots", :vcr do
  #  make_api_request
    
    get '/api/v1/learning_resources?country=germany'

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    data = resources[:data]

    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq("learning_resource")
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes][:country]).to eq("germany")
    expect(data[:attributes][:video]).to be_a(Hash)
    expect(data[:attributes][:video][:title]).to eq("A Super Quick History of Germany")
    expect(data[:attributes][:video][:youtube_video_id]).to eq("7sxora2imC0")
    expect(data[:attributes][:images]).to be_a(Array)
    expect(data[:attributes][:images][0][:alt_tag]).to eq("white and pink petaled flowers on metal fence near concrete houses and tower at daytime")
    expect(data[:attributes][:images][0][:url]).to eq("https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixid=M3w1Mjc3MTd8MHwxfHNlYXJjaHwxfHxnZXJtYW55fGVufDB8fHx8MTY5OTkxMzg4N3ww&ixlib=rb-4.0.3")
  end

  it "can handle countries with spaces", :vcr do
  #  make_api_request
    
    get '/api/v1/learning_resources?country=new zealand'

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    data = resources[:data]

    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq("learning_resource")
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes][:video]).to be_a(Hash)
    expect(data[:attributes][:images]).to be_a(Array)
  end

  it "returns empty data for no data", :vcr do
  #  make_api_request
    
    get '/api/v1/learning_resources?country=totallynotacountry'

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    data = resources[:data]

    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq("learning_resource")
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes][:country]).to eq("totallynotacountry")
    expect(data[:attributes][:video]).to be_a(Hash)
    expect(data[:attributes][:video][:title]).to eq(nil)
    expect(data[:attributes][:video][:youtube_video_id]).to eq(nil)
    expect(data[:attributes][:images]).to be_a(Array)
    expect(data[:attributes][:images].count).to eq(0)
  end
end