require 'pry'
module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      move = valid_moves.detect{|move| move }
      move if !board.full? && !board.taken?(move) && board.valid_move?(move)

    end

  end

end
