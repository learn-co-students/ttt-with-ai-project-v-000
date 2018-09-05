module Players
  class Computer < Player

    def move(board)
      #works but yes, its pretty dumb. To revisit.

      range = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      meh = range.sample
      if board.valid_move?(meh)
        move = meh
      end
    end

  end
end
