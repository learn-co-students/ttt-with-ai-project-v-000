require 'pry'

module Players
  class Computer < Player


def move(board)
position = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
if board.valid_move?(position)
  position
end
end


  end
end
