class DestinationWeatherDecorator
  attr_reader :summary, :temperature

  def initialize(forecast)
    @summary = forecast.summary
    @temperature = forecast.temperature.round
  end
end
