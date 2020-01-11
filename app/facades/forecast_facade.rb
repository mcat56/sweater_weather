class ForecastFacade

  def initialize(location)
    @location = location
  end

  def get_coordinates
    latlong = GoogleGeocodeService.get_coordinates(@location)
  end

  def get_forecast
    forecast = DarkSkyService.get_forecast(get_coordinates)
  end



end
