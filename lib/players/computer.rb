module Players
  class Computer < Player
  
    Move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
      Move.sample
    end
  end
end
