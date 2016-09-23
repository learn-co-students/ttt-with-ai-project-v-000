
module Players

  class Computer < Player

    def move(board)

      a = ["2", "4", "6", "7", "8", "9"] # array of moves, less center and upper corner
      #take center square if open, otherwise, upper corner; otherwise, random move
      if board.valid_move?(5)
        "5"
      elsif board.valid_move?(1)
        "1"
      elsif board.valid_move?(3)
        "3"
      else
        a.sample
      end
      # a = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # a.sample
    end

  end

end
