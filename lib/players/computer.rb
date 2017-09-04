class Players::Computer < Player
		
		def move(board)
			move_arr = ["1", "2","3","4","5","6","7","8","9"]
			move_arr.sample
		end
	
end