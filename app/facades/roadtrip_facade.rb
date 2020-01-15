class RoadtripFacade
  attr_reader :id, :origin, :destination, :origin, :cache_key

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
  end

  def cache_key
    { facade: self.class.to_s }
  end

  def travel_time
    @time ||= GoogleDirectionsService.get_travel_time(@origin, @destination)
    @time[:text]
  end

  def destination_coordinates
    @coord ||= Coordinate.new(GoogleGeocodeService.get_coordinates(@destination))
  end

  def arrival_forecast
    forecast = DarkSkyService.get_destination_forecast(destination_coordinates, @time[:value] )
    arrival_forecast = ArrivalForecast.new(forecast)
    ArrivalForecastPresenter.new(arrival_forecast)
  end
end
