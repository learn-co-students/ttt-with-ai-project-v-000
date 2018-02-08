
module Players

  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      if !board.taken?(5)
        move = "5"
      else
        valid_moves.sample
      end
    end

  end
end
# || @board.cells[i[1]] == @board.cells[i[2]] || @board.cells[i[0]] ==
