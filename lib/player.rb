class Player
  attr_reader :token
  attr_accessor :turn_count, :opponent

  def initialize(token)
    @token = token
    @turn_count = 0
  end

  def opponent # For better or worse, self.opponent is not actually the player's opponent. Instead, it's a body-double for the opponent possessing the opponent's token.
    if @token == "X"
      @opponent = Player.new("O")
    else
      @opponent = Player.new("X")
    end
  end

end
