class TouristSite
attr_reader :id, :name, :address, :place_id
  def initialize(data)
    @id = nil
    @name = data&.[](:properties)&.[](:name) ? data&.[](:properties)&.[](:name) : "name not present"
    @address = format_address(data)
    @place_id = data&.[](:properties)&.[](:place_id)
  end

  def format_address(data)
    if data&.[](:properties)&.[](:address_line1) && data&.[](:properties)&.[](:address_line2)
      data&.[](:properties)&.[](:address_line1) << " " << data&.[](:properties)&.[](:address_line2)
    elsif data&.[](:properties)&.[](:address_line1)
      data&.[](:properties)&.[](:address_line1)
    else
      "No Address"
    end
  end
end
