require 'pry'
module Players
  class Computer < Player

    def move(board)
      computer_move = "0"
      while !board.valid_move?(computer_move)
        computer_move = (rand(9)+1).to_s
      end
      computer_move
    end
#binding.pry
  end
end
