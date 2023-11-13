class PlaceService < ApplicationService

  def conn
    Faraday.new(url: 'https://api.geoapify.com') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.places[:api_key]
    end
  end

  # def places(data)
  #   json_parse(
  #     conn.get("/v2/places") do |req|
  #       req.params['categories'] = xxxx
  #       req.params['conditions'] = xxxxx
  #       req.params['filter'] = xxxxx
  #     end
  #   )
  # end

  def test
      json_parse(
        conn.get("/v2/places") do |req|
          req.params['categories'] = 'catering.restaurant'
          req.params['filter'] = 'rect:-73.99331143343392,40.77129742280923,-73.97215311088917,40.757134681430635'
        end
    )
  end
end