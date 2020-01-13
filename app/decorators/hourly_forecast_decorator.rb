class HourlyForecastDecorator
  attr_reader :humidity, :temperature, :summary
  def initialize(forecast)
    @summary = forecast.summary
    @humidity = (forecast.humidity * 100).round
    @temperature = forecast.temperature.round
  end
end
