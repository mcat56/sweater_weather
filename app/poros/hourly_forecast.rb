class HourlyForecast
  attr_reader :summary, :icon, :humidity, :temperature, :high, :low

  def initialize(count, forecast)
    @summary = forecast[:hourly][count][:summary]
    @icon = forecast[:hourly][count][:icon]
    @humidity = forecast[:hourly][count][:humidity]
    @temperature = forecast[:hourly][count][:temperature]
  end


end
