class DailyForecast
  attr_reader :high, :low, :id, :today, :tonight

  def initialize(forecast)
    @id = nil
    @today = forecast[:daily][:data].first[:summary]
    @high = forecast[:daily][:data].first[:temperatureHigh]
    @low =  forecast[:daily][:data].first[:temperatureLow]
    @tonight = forecast[:daily][:data][3][:summary]
  end
end
