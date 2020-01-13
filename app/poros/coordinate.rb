class Coordinate
  attr_reader :lat, :lng

  def initialize(coords)
    @lat = coords[:lat]
    @lng = coords[:lng] || coords[:long]
  end
end
