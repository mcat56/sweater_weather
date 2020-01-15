class HourlyForecastSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hours

  attributes :id, :summary, :humidity, :temperature

  attribute :humidity do |forecast|
    (forecast.humidity * 100).round
  end

  attribute :temperature do |forecast|
    forecast.temperature.round
  end
end
