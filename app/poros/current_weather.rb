class CurrentWeather
  attr_reader :summary, :icon,
              :temperature, :humidity,
              :feels_like, :visibility,
              :uvIndex

  def initialize(forecast)
    @summary = forecast[:currently][:summary]
    @icon = forecast[:currently][:icon]
    @temperature = forecast[:currently][:temperature]
    @humidity = forecast[:currently][:humidity]
    @visibility = forecast[:currently][:visibility]
    @uvIndex = forecast[:currently][:uvIndex]
    @feels_like = forecast[:currently][:apparentTemperature]
  end
end
