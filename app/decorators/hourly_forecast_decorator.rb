class HourlyForecastDecorator
  attr_reader :humidity, :temperature, :summary, :icon

  def initialize(forecast)
    @summary = forecast.summary
    @icon = forecast.icon
    @humidity = (forecast.humidity * 100).round
    @temperature = forecast.temperature.round
  end
end
