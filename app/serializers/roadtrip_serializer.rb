class RoadtripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :travel_time, :arrival_forecast, :origin, :destination
end
