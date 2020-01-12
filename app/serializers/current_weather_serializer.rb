class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :summary, :icon, :temperature, :humidity,
             :feels_like, :visibility, :uvIndex


end
