class ApplicationService
  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end