class CurrentWeatherDecorator
  attr_reader :temperature, :humidity,
              :feels_like, :visibility,
              :summary, :uvindex,
              :icon, :time

  def initialize(forecast)
    @summary = forecast.summary
    @uvIndex = forecast.uvIndex
    @icon = forecast.icon
    @time = format_time(forecast.time, forecast.time_zone)
    @temperature = forecast.temperature.round
    @humidity = (forecast.humidity * 100).round
    @feels_like = forecast.feels_like.round
    @visibility = ('%2.f' % forecast.visibility).to_f
  end

  def format_time(unix, zone)
    d = Time.at(unix).in_time_zone(zone)
    d.strftime('%I:%M') + ' ' + d.strftime('%p') + ', ' + d.strftime('%m') + '/' + d.strftime('%d')
  end
end
