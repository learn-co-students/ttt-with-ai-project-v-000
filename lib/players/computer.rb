module Players
  class Computer < Player
    def move(board)
      spot = nil
      if board.turn_count == 0
      	spot = "5"
      else board.turn_count == 2
    	if board.valid_move?(5)
    		spot = "1"
    	else 
    		spot ="5"
    	end	
      end
      spot
  	end
   end
 end
