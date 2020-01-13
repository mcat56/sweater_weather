class CurrentWeatherDecorator
  attr_reader :temperature, :humidity,
              :feels_like, :visibility,
              :summary, :uvindex

  def initialize(forecast)
    @summary = forecast.summary
    @uvIndex = forecast.uvIndex
    @temperature = forecast.temperature.round
    @humidity = (forecast.humidity * 100).round
    @feels_like = forecast.feels_like.round
    @visibility = ('%2.f' % forecast.visibility).to_f
  end
end
