class DailyyForecastSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hours

  attributes :id, :high, :low

  attribute :high do |forecast|
    forecast.high.round
  end

  attribute :low do |forecast|
    forecast.low.round
  end
end
