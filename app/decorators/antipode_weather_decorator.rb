class AntipodeWeatherDecorator
  attr_reader :temperature, :summary

  def initialize(forecast)
    @summary = forecast.summary
    @temperature = forecast.temperature.round
  end
end
