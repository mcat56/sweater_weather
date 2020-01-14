class CurrentWeatherDecorator
  attr_reader :temperature, :humidity,
              :feels_like, :visibility,
              :summary, :uvindex,
              :icon, :time

  def initialize(forecast)
    @summary = forecast.summary
    @uvIndex = forecast.uvIndex
    @icon = forecast.icon
    @time = format_time(forecast.time)
    @temperature = forecast.temperature.round
    @humidity = (forecast.humidity * 100).round
    @feels_like = forecast.feels_like.round
    @visibility = ('%2.f' % forecast.visibility).to_f
  end

  def format_time(unix)
    d = DateTime.strptime(unix.to_s, '%s')
    d.strftime('%I:%M') + ' ' + d.strftime('%p') + ', ' + d.strftime('%m') + '/' + d.strftime('%d')
  end
end
