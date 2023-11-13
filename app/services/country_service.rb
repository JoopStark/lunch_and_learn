class CountryService < ApplicationService

  def conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def country
    countries = json_parse(conn.get("/v3.1/all"))

    countries[rand(0...countries.count)][:name][:common]
  end
end