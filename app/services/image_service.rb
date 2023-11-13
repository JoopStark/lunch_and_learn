class ImageService < ApplicationService

  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = Rails.application.credentials.unsplash[:access_code]
    end
  end

  def images(country)
    json_parse(
      conn.get("/search/photos") do |req|
        req.params['query'] = country
      end
    )
  end
end