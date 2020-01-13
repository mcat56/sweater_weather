class CurrentWeather
  attr_reader :summary, :temperature,
              :humidity, :feels_like,
              :visibility, :uvIndex

  def initialize(forecast)
    @nil = nil
    @summary = forecast[:currently][:summary]
    @temperature = forecast[:currently][:temperature]
    @humidity = forecast[:currently][:humidity]
    @visibility = forecast[:currently][:visibility]
    @uvIndex = forecast[:currently][:uvIndex]
    @feels_like = forecast[:currently][:apparentTemperature]
  end
end
