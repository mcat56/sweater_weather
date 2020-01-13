class HourlyForecast
  attr_reader :summary, :humidity, :temperature, :id, :icon

  def initialize(count, forecast)
    @id = nil
    @summary = forecast[:hourly][:data][count][:summary]
    @icon = forecast[:hourly][:data][count][:icon]
    @humidity = forecast[:hourly][:data][count][:humidity]
    @temperature = forecast[:hourly][:data][count][:temperature]
  end
end
