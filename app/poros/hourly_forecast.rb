class HourlyForecast
  attr_reader :summary, :humidity, :temperature, :id, :icon, :time, :time_zone

  def initialize(count, forecast)
    @id = nil
    @summary = forecast[:hourly][:data][count][:summary]
    @icon = forecast[:hourly][:data][count][:icon]
    @humidity = forecast[:hourly][:data][count][:humidity]
    @time = forecast[:hourly][:data][count][:time]
    @temperature = forecast[:hourly][:data][count][:temperature]
    @time_zone = forecast[:timezone]
  end
end
