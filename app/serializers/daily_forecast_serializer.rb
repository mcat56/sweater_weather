class DailyyForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :high, :low 
end
