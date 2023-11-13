class Api::V1::TouristSitesController < ApplicationController
  def index
    capitol_latlng = CountryService.new.capitol_location(params[:country])

    if capitol_latlng
      render json: TouristSiteSerializer.new(
                      PlaceService.new
                                  .tourism(capitol_latlng)&.[](:features).map do |feature|
                                    TouristSite.new(feature)
                                  end)
    else
      render json: { "data": "[]" } , status: 204
    end
  end
end