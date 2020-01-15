class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 24.hours

  attributes :id, :background
end
