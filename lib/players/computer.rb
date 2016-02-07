class Player::Computer < Player

	 COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

	def move(board)
		@board = board
		available = []
		board.cells.each_with_index do |cell, i|
			if cell == " "
				available << (i+1).to_s
			end
		end

		@two = " "	

		#Checks to see if 2 of the three cells for each win combo are taken, if so it returns the third cell as @two
		COMBINATIONS.each do |combo|
			if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " " && board.cells[combo[2]] == " "
				@two = (combo[2] + 1).to_s
			elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != " " && board.cells[combo[0]] == " "
				@two = (combo[0]+1).to_s
			elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " " && board.cells[combo[1]] == " "
				@two = (combo[1]+1).to_s
			end
		end

		#Sets token value for oppossing player as p2
		if token == "X"
			p2 = "O"
		elsif token == "O"
			p2 = "X"
		end
				
		#Checks to see if p2 is one move away from winning and blocks
		if @two && available.include?(@two)
			@two

		#Takes middle space if available 
		elsif available.include?("5")
			"5"

		#Blocks opposite corner strategy
		elsif board.cells[0] == p2 && board.cells[8] == p2 || board.cells[6] == p2 && board.cells[2] == p2
			if available.include?("2")
				"2"
			elsif available.include?("4")
				"4"
			elsif available.include?("6")
				"6"
			elsif available.include?("8")
				"8"
			else
				available[0]
			end

		#Blocks middle first strategy 
		elsif board.cells[4] == p2 && board.cells[0] == p2 || board.cells[4] == p2 && board.cells[8] == p2
			if available.include?("3")
				"3"
			elsif available.include?("7")
				"7"
			else
				available[0]
			end

		elsif board.cells[4] == p2 && board.cells[2] == p2 || board.cells[4] == p2 && board.cells[6] == p2
			if available.include?("1")
				"1"
			elsif available.include?("9")
				"9"
			else
				available[0]
			end

		#Takes corner
		elsif available.include?("3")
			"3"

		#Takes first available
		else
			available[0]
		end
	end
end