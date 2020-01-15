class LocationPresenter
  attr_reader :location

  def initialize(location)
    @location = location.location.split(',')[0].capitalize + ', ' + location.location.split(',')[1].upcase
  end
end
