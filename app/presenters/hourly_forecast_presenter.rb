class HourlyForecastPresenter
  attr_reader :humidity, :temperature, :summary, :icon, :time

  def initialize(forecast)
    @summary = forecast.summary
    @icon = forecast.icon
    @humidity = (forecast.humidity * 100).round
    @temperature = forecast.temperature.round
    @time = format_time(forecast.time, forecast.time_zone)
  end

  def format_time(unix, zone)
    d = Time.at(unix).in_time_zone(zone)
    d.strftime('%I') + ' ' + d.strftime('%p')
  end
end
