class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hours

  attributes :id, :travel_time, :arrival_forecast, :origin, :destination
end
