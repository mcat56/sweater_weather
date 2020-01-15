class GeoLocation
  attr_reader :location, :country

  def initialize(geo_location)
    @location =  geo_location[:results].first[:address_components].find {|hash| hash[:types].include?('locality') }[:long_name] + ', ' + geo_location[:results].first[:address_components].find {|hash| hash[:types].include?('administrative_area_level_1') }[:short_name]
    @country = geo_location[:results].first[:address_components].find {|hash| hash[:types].include?('country') }[:long_name]
  end
end
