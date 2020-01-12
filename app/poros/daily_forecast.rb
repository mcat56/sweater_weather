class DailyForecast
  attr_reader :high, :low, :id

  def initialize(forecast)
    @id = nil
    @high = forecast[:daily][:data].first[:temperatureHigh]
    @low =  forecast[:daily][:data].first[:temperatureLow]
  end
end
