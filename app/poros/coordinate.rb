class Coordinate
  attr_reader :lat, :lng

  def initialize(coords)
    @lat = coords[:results].first[:geometry][:location][:lat]
    @lng = coords[:results].first[:geometry][:location][:lng]
  end
end
