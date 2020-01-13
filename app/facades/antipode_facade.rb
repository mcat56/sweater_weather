class AntipodeFacade
  attr_reader :id, :search_location

  def initialize(location)
    @id = nil
    @search_location = LocationDecorator.new(location).location
  end

  def antipode_coord
    coords = GoogleGeocodeService.get_coordinates(@search_location)
    coord = Coordinate.new(coords)
  end

  def antipode_city
    coords = AmypodeService.get_coordinates(antipode_coord)
    coord = Coordinate.new(coords)
  end

  def location_name
    GoogleGeocodeService.get_city(antipode_city)
  end

  def antipode_weather
    w = DarkSkyService.get_forecast(antipode_city)
    aw = AntipodeWeather.new(w)
    AntipodeWeatherDecorator.new(aw)
  end
end
