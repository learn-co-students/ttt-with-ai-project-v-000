module Players
  class Computer < Player
    def move(board)
      spot = nil
      if board.turn_count == 0
      	spot = "1"
      elsif board.turn_count == 1
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
