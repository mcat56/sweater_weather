class Background
  attr_reader :id, :image_url

  def initialize(url)
    @id = nil
    @image_url = url
  end
end
