class DailyyForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :high, :low

  attribute :high do |forecast|
    forecast.high.round
  end

  attribute :low do |forecast|
    forecast.low.round
  end
end
