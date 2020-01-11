class ForecastFacade

  def initialize(location)
    @location = location
  end

  def get_coordinates
    coords = GoogleGeocodeService.get_coordinates(@location)
    Coordinate.new(coords)
  end

  def get_forecast
    @forecast ||= DarkSkyService.get_forecast(get_coordinates)
  end

  def current_weather
    CurrentWeather.new(get_forecast)
  end

  def hourly_forecast
    i = 0
    hourly = []
    8.times do
      hourly << HourlyForecast.new(i, get_forecast)
      i += 1
    end
    hourly
  end

  def daily_forecast
    DailyForecast.new(get_forecast)
  end
end
