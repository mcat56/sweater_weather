class DestinationWeather
  attr_reader :summary, :temperature
  
  def initialize(forecast)
    @summary = forecast[:currently][:summary]
    @temperature = forecast[:currently][:temperature]
  end
end
