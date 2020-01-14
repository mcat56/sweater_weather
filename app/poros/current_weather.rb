class CurrentWeather
  attr_reader :summary, :temperature,
              :humidity, :feels_like,
              :visibility, :uvIndex,
              :icon, :time

  def initialize(forecast)
    @nil = nil
    @summary = forecast[:currently][:summary]
    @icon = forecast[:currently][:icon]
    @temperature = forecast[:currently][:temperature]
    @humidity = forecast[:currently][:humidity]
    @visibility = forecast[:currently][:visibility]
    @uvIndex = forecast[:currently][:uvIndex]
    @time = forecast[:currently][:time]
    @feels_like = forecast[:currently][:apparentTemperature]
  end
end
