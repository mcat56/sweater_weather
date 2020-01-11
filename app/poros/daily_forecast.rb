class DailyForecast
  attr_reader :high, :low

  def initialize(forecast)
    @high = forecast[:daily][:data].first[:temperatureHigh]
    @low =  forecast[:daily][:data].first[:temperatureLow]
  end
end
