class DailyForecast
  attr_reader :high, :low, :id, :today, :tonight, :icon

  def initialize(forecast)
    @id = nil
    @icon = forecast[:daily][:icon]
    @today = forecast[:daily][:data].first[:summary]
    @high = forecast[:daily][:data].first[:temperatureHigh]
    @low =  forecast[:daily][:data].first[:temperatureLow]
    @tonight = night_forecast(forecast)
  end

  def night_forecast(forecast)
    if Time.now.hour < 20
      forecast[:hourly][:data].find do |hr|
        DateTime.strptime("#{hr[:time]}", '%s').hour == 2
      end[:summary]
    else
      forecast[:currently][:summary]
    end
  end
end
