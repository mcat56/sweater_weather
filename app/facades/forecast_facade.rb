class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = nil
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
    c = CurrentWeather.new(get_forecast)
    CurrentWeatherDecorator.new(c)
  end

  def hourly_forecast
    i = 0
    hourly = []
    8.times do
      hourly << HourlyForecast.new(i, get_forecast)
      i += 1
    end
    hourly.map { |h| HourlyForecastDecorator.new(h) }
  end

  def daily_forecast
    d = DailyForecast.new(get_forecast)
    DailyForecastDecorator.new(d)
  end
end
