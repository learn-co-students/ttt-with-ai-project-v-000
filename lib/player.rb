class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move
    raise "Should be implemented in subclass"
  end

end