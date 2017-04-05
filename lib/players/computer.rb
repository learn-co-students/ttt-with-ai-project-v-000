module Players

	class Computer < Player
		def move(board)
			board.cells.index(" ")
		end
		
	end
	


end
