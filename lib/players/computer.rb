module Players

  class Computer < Player

    def move(board)
      a = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      a.sample
    end

  end

end
