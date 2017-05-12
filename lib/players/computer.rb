module Players 
  class Computer < Player
    @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  
    def move(board)
     input = @@valid_moves.sample
    end
    
  end
end

    
  