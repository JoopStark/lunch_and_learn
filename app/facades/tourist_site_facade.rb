class TouristSiteFacade
  def self.index(country)
    capitol_latlng = CountryService.new.capitol_location(country)

    if capitol_latlng
      {json: TouristSiteSerializer.new(
                      PlaceService.new
                                  .tourism(capitol_latlng)&.[](:features).map do |feature|
                                    TouristSite.new(feature)
                                  end)}
    else
      {json: { "data": "[]" } , status: 204}
    end
  end
end