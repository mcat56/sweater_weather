class AntipodeFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @search_location = location
  end

  def antipode_coord
    coords = GoogleGeocodeService.get_coordinates(@search_location)
    coord = Coordinate.new(coords)
  end

  def antipode_city
    coords = AmypodeService.get_coordinates(antipode_coord)
  end

  def location_name
    city = GoogleGeocodeService.get_city(antipode_city)
  end

  def anitpode_weather
    w = DarkSkyService.get_weather(antipode_city)
    aw = AntipodeWeather.new(w)
    AntipodeWeatherDecorator.new(aw)
  end
end
