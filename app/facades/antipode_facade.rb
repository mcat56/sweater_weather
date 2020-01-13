class AntipodeFacade
  attr_reader :id, :search_location

  def initialize(location)
    @id = nil
    @search_location = LocationDecorator.new(location).location
  end

  def antipode_coord
    @coord ||= Coordinate.new(GoogleGeocodeService.get_coordinates(@search_location))
  end

  def antipode_city
    @city ||= Coordinate.new(AmypodeService.get_coordinates(antipode_coord))
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
