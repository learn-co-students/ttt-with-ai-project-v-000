require 'pry'
class Computer < Player

  def move(board)

    input = (1 + rand(9)).to_s

   if board.valid_move?(input) == false
    self.move
  else
    return input
  end
  end
end