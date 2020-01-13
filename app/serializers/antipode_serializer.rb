class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :search_location, :location_name, :antipode_weather
end
