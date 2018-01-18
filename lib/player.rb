class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end

class Player::Human < Player

  def move(board)
    input = 0
    puts "where would you like to go?"
    until input.to_i < 10 && input.to_i > 0
      input = gets
    end
    #board.update(2, "X")
    input
  end

end

class Player::Computer < Player

  def move(board)
    puts "*beep boop*"
    deep_blue = rand(10)
    until board.valid_move?(deep_blue)
      deep_blue = rand(10)
    end
    deep_blue.to_s
  end

end