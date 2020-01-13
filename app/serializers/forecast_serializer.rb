class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :hourly_forecast, :daily_forecast, :current_weather
end
