module Players

class Computer < Player
  def move(board)
    	nPos = rand(9) + 1
    if !board.full?
	     	canMoveHere = board.valid_move?(nPos)
	    while !canMoveHere do
		  	canMoveHere = board.valid_move?(nPos)
	  	end  # end while
		  canMoveHere
	  else
		  false
  	end # end if
  end  # end #move
end #end Computer class


end 
