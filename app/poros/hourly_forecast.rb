class HourlyForecast
  attr_reader :summary, :icon, :humidity, :temperature, :high, :low

  def initialize(count, forecast)
    @summary = forecast[:hourly][:data][count][:summary]
    @icon = forecast[:hourly][:data][count][:icon]
    @humidity = forecast[:hourly][:data][count][:humidity]
    @temperature = forecast[:hourly][:data][count][:temperature]
  end
end