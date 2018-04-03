class Player

  attr_reader :token

  def initialize (token)
    @token = token
  end

  def player_1
    token = "X"
  end

  def player_2
    token = "O"
  end

  class Move
  end

end
