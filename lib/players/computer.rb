module Players
	class Computer < Player

		def move(board)
			if board.valid_move?("5")
				"5"
			elsif board.valid_move?("1") || board.valid_move?("3") || board.valid_move?("7") ||board.valid_move?("9")
				["1", "3", "7", "9"].select {|position| board.valid_move?(position)}.sample
			else
				["2", "4", "6", "8"].select {|position| board.valid_move?(position)}.sample
			end
		end

		# def move(board) # EXTRA EASY MODE
	 # 	  ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select {|position| board.valid_move?(position)}.sample
		# end #end method

	end #end class
end #end module
