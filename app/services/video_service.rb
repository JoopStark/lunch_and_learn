class VideoService < ApplicationService

  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |faraday|
      faraday.params['key'] = Rails.application.credentials.youtube[:api_key]
    end
  end

  def video(country)
    json_parse(
      conn.get("/youtube/v3/search") do |req|
        req.params['q'] = country
        req.params['part'] = "snippet"
        req.params['channelId'] = "UCluQ5yInbeAkkeCndNnUhpw"
        req.params['maxResults'] = "1"
      end
    )
  end
end