class DailyForecast
  attr_reader :high, :low

  def initialize(forecast)
    @high = forecast[:daily].first[:temperatureHigh]
    @low =  forecast[:daily].first[:temperatureLow]
  end
end
