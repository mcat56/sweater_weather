class LocationDecorator
  attr_reader :location
  
  def initialize(location)
    @location = location.gsub('_', ' ').split(' ').map {|w| w.capitalize}.join(' ')
  end
end
