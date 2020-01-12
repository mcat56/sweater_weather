class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id

  attribute :hourly_forecast do |hf|
    binding.pry
  end

  attribute :daily_forecast do |df|

  end

  attribute :current_weather do |cw|

  end


end
