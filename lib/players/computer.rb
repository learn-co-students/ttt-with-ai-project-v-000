module Players

 class Computer < Player

    def move(board)
      if self.token == "X"
        if board.taken?(5) == nil || false
          return "5"
        elsif board.taken?(3) == nil || false
          return "3"
        elsif board.taken?(7) == nil || false
          return "7"
        elsif board.taken?(4) == nil || false
          return "4"
        elsif board.taken?(6) == nil || false
          return "6"
        elsif board.taken?(9) == nil || false
          return "9"
        elsif board.taken?(1) == nil || false
          return "1"
        elsif board.taken?(2) == nil || false
          return "2"
        elsif board.taken?(8) == nil || false
          return "8"
        end
      end
      input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end
  end

end
