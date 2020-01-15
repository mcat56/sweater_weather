class BackgroundFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def cache_key
    { facade: self.class.to_s }
  end

  def background
    image = PexelService.get_photo(@location)
    Background.new(image)
  end
end
