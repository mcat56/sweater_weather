class GeoLocation
  attr_reader :location, :country

  def initialize(geo_location)
    @location = geo_location[:results].first[:address_components][0][:long_name] + ', ' + geo_location[:results].first[:address_components][2][:short_name]
    @country = geo_location[:results].first[:address_components][3][:long_name]
  end
end
