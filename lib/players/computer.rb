module Players
  class Computer < Player
    def move(board)
      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      moves.sample
    end
  end
end
