class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

class Human < Player
  def move(input)
    input = gets.chomp
    input
  end
end

class Computer < Player
  def move(board)
    input = 1 + rand(9)
    number = input.to_s
    if board.valid_move?(number)
      number
    else
      move(board)
    end
  end
end
