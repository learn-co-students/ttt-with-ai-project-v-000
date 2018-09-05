module Players
  class Computer < Player

    def move(board)
      #goal, 3 in a row.starting with just getting tests to pass.

      range = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      meh = range.sample
      if board.valid_move?(meh)
        move = meh
      end
    end

  end
end
