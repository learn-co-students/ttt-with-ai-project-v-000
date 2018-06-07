
module Players
  class Computer < Player
    
    def move(board)
      
      if board.turn_count < 4
        
        if board.position("6") != ' '
          # prioritize center
          "6"
        elsif 
        end
        
      else
      end
      
    end
    
  end
end