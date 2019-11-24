module Players

  class Computer < Player

    CENTER = "5"
    CORNERS = ["1", "3", "7", "9"]
    MIDDLES = ["2", "4", "6", "8"]

    def move(board)
      if !board.taken?(CENTER)
        return CENTER
      end
      open = CORNERS.select { |corner| !board.taken?(corner) }
      if open.size > 0
        return open[rand(CORNERS.size)]
      end
      open = MIDDLES.select { |middle| !board.taken?(middle) }
      return open[rand(MIDDLES.size)]
    end

  end

end
