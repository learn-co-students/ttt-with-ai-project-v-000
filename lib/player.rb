class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end
  def opponent_token
    token == "X" ? "O" : "X"
  end

  def player_type
    case self
      when Players::Human then return "Human"
      when Players::Computer then return "Computer"
    end
  end
end
