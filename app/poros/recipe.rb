class Recipe
attr_reader :id, :title, :url, :country, :image
  def initialize(data, country)
    @id = nil
    @url = data[:recipe][:uri]
    @title = data[:recipe][:label]
    @country = country
    @image = data[:recipe][:image]
  end
end
  