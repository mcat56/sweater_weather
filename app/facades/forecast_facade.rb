class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def get_coordinates
    coordinates = GoogleGeocodeService.get_coordinates(@location)
    Coordinate.new(coordinates)
  end

  def get_forecast
    @forecast ||= DarkSkyService.get_forecast(get_coordinates)
  end

  def current_weather
    current_weather = CurrentWeather.new(get_forecast)
    CurrentWeatherPresenter.new(current_weather)
  end

  def hourly_forecast
    i = 0
    hourly = []
    8.times do
      hourly << HourlyForecast.new(i, get_forecast)
      i += 1
    end
    hourly.map { |h| HourlyForecastPresenter.new(h) }
  end

  def daily_forecast
    daily_forecast = DailyForecast.new(get_forecast)
    DailyForecastPresenter.new(daily_forecast)
  end
end
