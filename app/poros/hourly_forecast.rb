class HourlyForecast
  attr_reader :summary, :humidity, :temperature, :id

  def initialize(count, forecast)
    @id = nil
    @summary = forecast[:hourly][:data][count][:summary]
    @humidity = forecast[:hourly][:data][count][:humidity]
    @temperature = forecast[:hourly][:data][count][:temperature]
  end
end
