class BackgroundFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def background
    image = PexelService.get_photo(@location)
    Background.new(image)
  end
end
