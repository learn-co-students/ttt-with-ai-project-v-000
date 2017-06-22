require 'pry'

module Players
  class Computer < Player

    def move(board)
      valid_moves = []
      for i in 1..9
        if board.valid_move?(i.to_s)
          valid_moves << i.to_s
        end
      end
      valid_moves.sample
    end

  end
end
