class RoadtripFacade
  attr_reader :id, :origin, :destination

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
  end

  def travel_time
    @time ||= GoogleDirectionsService.get_travel_time(@origin, @destination)
    @time[:text]
  end

  def destination_coords
    @coord ||= Coordinate.new(GoogleGeocodeService.get_coordinates(@destination))
  end

  def destination_weather
    forecast = DarkSkyService.get_destination_forecast(destination_coords, @time[:value])
    des_weather = DestinationWeather.new(forecast)
    DestinationWeatherDecorator.new(des_weather)
  end
end
