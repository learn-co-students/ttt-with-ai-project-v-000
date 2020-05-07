module Players
  
  class Computer < Player 
    
    MOVE = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
      MOVE.sample
    end
  end 
end 