class Coordinate
  attr_reader :lat, :lng

  def initialize(geo_location)
    @lat = geo_location[:results].first[:geometry][:location][:lat]
    @lng = geo_location[:results].first[:geometry][:location][:lng]
  end
end
