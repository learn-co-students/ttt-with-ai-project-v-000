require 'pry'
module Players
  class Computer < Player


    def move(board)
      position = Random.rand(1..9).to_s
      if board.valid_move?(position)
        position
      else
        position = Random.rand(1..9).to_s
      end
    end
  end
end
