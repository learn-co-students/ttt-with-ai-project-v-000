module Players
  
  class Computer < Player
    
    VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    def move(board)
      VALID_MOVES.sample
    end
    
  end
  
end