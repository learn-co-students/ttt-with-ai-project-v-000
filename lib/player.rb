class Player

  attr_reader :token, :difficulty

  def initialize(token, difficulty = "hard")
    @token = token
    @difficulty = difficulty
  end

end
