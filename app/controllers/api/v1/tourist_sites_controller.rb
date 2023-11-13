class Api::V1::TouristSitesController < ApplicationController
  def index
    capitol_latlng = CountryService.new.capitol_location(params[:country])

    test = PlaceService.new.tourism(capitol_latlng)&.[](:features).map do |feature|
          Tourism.new(feature)
    end
    
    binding.pry

    "blah"
  end
end