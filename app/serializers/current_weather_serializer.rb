class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true, cache_length: 1.hours

  attributes :id, :summary,
             :temperature, :visibility,
             :uvIndex, :humidity

  attribute :feels_like do |forecast|
    forecast.feels_like.round
  end

  attribute :visibility do |forecast|
    ('%.2f' % forecast.visibility).to_f
  end

  attribute :temperature do |forecast|
    forecast.temperature.round
  end

  attribute :humidity do |forecast|
    (forecast.humidity * 100).round
  end
end
