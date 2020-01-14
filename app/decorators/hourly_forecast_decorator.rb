class HourlyForecastDecorator
  attr_reader :humidity, :temperature, :summary, :icon, :time

  def initialize(forecast)
    @summary = forecast.summary
    @icon = forecast.icon
    @humidity = (forecast.humidity * 100).round
    @temperature = forecast.temperature.round
    @time = format_time(forecast.time)
  end

  def format_time(unix)
    d = DateTime.strptime(unix.to_s, '%s')
    d.strftime('%I') + ' ' + d.strftime('%p')
  end
end
