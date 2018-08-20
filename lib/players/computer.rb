require 'pry'
module Players
  class Computer < Player

    def move(board) #computers game
      n = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      move = n unless board.taken?(n)
    end
  end
end
