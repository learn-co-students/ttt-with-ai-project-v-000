module Players
	class Computer < Player
    	def move(board)
	    	# if board.cells[5] == board.valid_move?(position)
	    	# 	5
	    	# elsif board.cells[1] == board.valid_move?(position)
	    	# 	1
	    	# elsif board.cells[3] == board.valid_move?(position)
	    	# 	3
	    	# elsif board.cells[7] == board.valid_move?(position)
	    	# 	7
	    	# elsif board.cells[9] == board.valid_move?(position)
	    	# 	9
	    	# else
	    		["1", "2", "3", "4", "5", "6", "7", "8", "9"].select {|position| board.valid_move?(position)}.sample
    		# end #end if block
    	end #end method
	end #end class
end #end module