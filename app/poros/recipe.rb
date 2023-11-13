class Recipe
attr_reader :id, :title, :url, :country, :image
  def initialize(data, country)
    @id = nil
    @title = data[:recipe][:uri]
    @url = data[:recipe][:label]
    @country = country
    @image = data[:recipe][:image]
  end
end
  