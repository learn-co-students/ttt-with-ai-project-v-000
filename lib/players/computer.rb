module Players
  class Computer < Player
   #  def move(board)
   #    spot = nil
   #    if board.turn_count == 0
   #    	spot = "5"
   #    elsif board.turn_count == 1
   #  	if board.valid_move?(5)
   #  		spot = "1"
   #  	else
   #  		spot ="5"
   #  	end
   #    end
   #    spot
  	# end
   # end

  #   1) if computer went first
		X = [] #keep track of where computer placed X
		board.turn_count == 1 #computer went first in turn
		place X on upper right corner #placed X on spot #3
		push 3 into X #place 3 in [] 
		corners = [1,3,7,9] 
		board.turn_count == 3 #computer went third in turn 
		loop through corners checking aganist board.valid_move? #loop through corners, compare 1,3,7,9 aganist board.valid_move? to find empty space
		place X on an empty corner #place X on the blank spot
		push 1,7, or 9 into X #place another number where the 2nd X is placed into [3, ]
		board.turn_count == 5 #computer went fifth in turn
		loop through WIN_COMBINATIONS and compare X. 
		place the third X
		






  #   2) if computer went second





 end
