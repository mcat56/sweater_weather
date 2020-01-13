class AntipodeWeatherDecorator
  attr_reader :current_temperature, :summary

  def initialize(forecast)
    @summary = forecast.summary
    @current_temperature = forecast.temperature.round
  end
end
