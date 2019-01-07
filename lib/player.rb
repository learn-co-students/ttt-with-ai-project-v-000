class Player
  attr_accessor :speed
  def initialize(token, speed = 1)
    @token = token.freeze
    @speed = speed
  end

  def token
    @token
  end

end
