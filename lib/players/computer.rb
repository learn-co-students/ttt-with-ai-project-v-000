require 'pry'
module Players

  class Computer < Player

    def move(board)
      input = rand(1..9)
      if board.valid_move?(input)
        input.to_s
      end
    end


  end
end
