class CountryService < ApplicationService

  def conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def country
    countries = json_parse(conn.get("/v3.1/all"))
    
    countries[rand(0...countries.count)][:name][:common]
  end
  
  def capitol_location(country)
    country_data= json_parse(conn.get("/v3.1/name/country"))

    # binding.pry
    country_data[0]&.[](:capitalInfo)&.[](:latlng)
    # :capitalInfo=>{:latlng=>[21.46, -71.14]}
  end
end