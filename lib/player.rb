class Player
  attr_reader :token

  def initialize(token = "X")
    @token = token
  end

  def token
    @token
  end

end
