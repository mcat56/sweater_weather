class ForecastFacade
  attr_reader :id, :location, :country

  def initialize(location)
    @id = nil
    @loc = location
    @location = nil
    @country = nil
  end

  def cache_key
    { facade: self.class.to_s }
  end

  def get_coordinates
    geo_location = GoogleGeocodeService.get_coordinates(@loc)
    get_location(geo_location)
    get_country(geo_location)
    Coordinate.new(geo_location)
  end

  def get_country(geo_location)
    @country = geo_location[:results].first[:address_components][3][:long_name]
  end

  def get_location(geo_location)
    @location = geo_location[:results].first[:address_components][0][:long_name] + ', ' + geo_location[:results].first[:address_components][2][:short_name]
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
