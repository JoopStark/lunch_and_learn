class Tourism
  attr_reader :id, :name, :address, :place_id
    def initialize(data)
      @id = nil
      @name = data&.[](:properties)&.[](:name)
      @address = (data&.[](:properties)&.[](:address_line1) << " " << data&.[](:properties)&.[](:address_line2))
      @place_id = data&.[](:properties)&.[](:place_id)
    end
  end
