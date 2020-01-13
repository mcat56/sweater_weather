class DailyForecast
  attr_reader :high, :low, :id, :today, :tonight

  def initialize(forecast)
    @id = nil
    @today = forecast[:daily][:data].first[:summary]
    @high = forecast[:daily][:data].first[:temperatureHigh]
    @low =  forecast[:daily][:data].first[:temperatureLow]
    @tonight = tonight_summary(forecast)
  end

  def tonight_summary(forecast)
    forecast[:hourly][:data].find do |hr|
      DateTime.strptime("#{hr[:time]}", '%s').hour == 20
    end[:summary]
  end
end
