class RoadtripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :travel_time, :destination_weather, :origin, :destination
end
