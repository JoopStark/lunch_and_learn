class TouristSite
attr_reader :id, :name, :address, :place_id
  def initialize(data)
    @id = nil
    @name = data&.[](:properties)&.[](:name) ? data&.[](:properties)&.[](:name) : "name not present"
    @address = (data&.[](:properties)&.[](:address_line1) << " " << data&.[](:properties)&.[](:address_line2))
    @place_id = data&.[](:properties)&.[](:place_id)
  end
end
