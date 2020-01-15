class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hours

  attributes :id, :hourly_forecast, :daily_forecast, :current_weather
end
