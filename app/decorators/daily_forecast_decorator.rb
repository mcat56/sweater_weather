class DailyForecastDecorator
  attr_reader :high, :low, :today, :tonight

  def initialize(forecast)
    @today = forecast.today
    @high = forecast.high.round
    @low = forecast.low.round
    @tonight = forecast.tonight
  end
end
