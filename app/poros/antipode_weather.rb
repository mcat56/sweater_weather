class AntipodeWeather

  def initialize(forecast)
    @summary = forecast[:currently][:summary]
    @temperature = forecast[:currently][:temperature]
  end




end
