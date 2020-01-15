class Error
  attr_reader :message, :id

  def initialize(message)
    @message = message
  end
end
