class HourlyForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :summary, :icon, :humidity, :temperature
end
