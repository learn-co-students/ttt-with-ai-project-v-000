require 'pry'
module Players
  class Computer < Player
    def move(board)
      move = rand(0..8)
      until board.cells[move] == " " do
        move = rand(0..8)
      end
      move.to_s
    end
  end
end
