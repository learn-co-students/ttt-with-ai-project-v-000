require_relative "../player.rb"
module Players
	class Player::Computer < Player

		def move(board)
			#mark the centre if it is free, otherwise mark a corner
			#if either player has two in a row, place a third to either block/make a row
			#mark a corner if opponent already has centre, and is not forming a row elsewhere
			#if you have the centre, try and occupy an outside square to start a row
			outside_squares = ["1", "2", "3", "4", "6", "7", "8", "9"]

			case

			    when !board.taken?("5")
					"5"
				when board.taken?("5") && board.cells[4] !=self.token
					if board.taken?("2") && board.cells[1] !=self.token && !board.taken?("8")
						"8"
					elsif board.taken?("3") && board.cells[2] !=self.token && !board.taken?("7")
						"7"
					elsif board.taken?("4") && board.cells[3] !=self.token && !board.taken?("6")
						"6"
					elsif board.taken?("6") && board.cells[5] !=self.token && !board.taken?("4")
						"4"
					elsif board.taken?("7") && board.cells[6] !=self.token && !board.taken?("3")
						"3"
					elsif board.taken?("8") && board.cells[7] !=self.token && !board.taken?("2")
						"2"
					elsif board.taken?("1") && board.cells[0] !=self.token && !board.taken?("9")
						"9"
					elsif board.taken?("9") && board.cells[8] !=self.token && !board.taken?("1")
						"1"
					else
						outside_squares.select {|square| !board.taken?(square)}.sample
					end
				when board.taken?("5") && board.cells[4] == self.token
					if board.taken?("1") && board.cells[0] != self.token && board.taken?("3") && board.cells[2] != self.token && !board.taken?("2")
						"2"
					elsif board.taken?("1") && board.cells[0] != self.token && board.taken?("2") && board.cells[1] != self.token && !board.taken?("3")
						"3"
					elsif board.taken?("2") && board.cells[1] != self.token && board.taken?("3") && board.cells[2] != self.token && !board.taken?("1")
						"1"
					elsif board.taken?("1") && board.cells[0] != self.token && board.taken?("7") && board.cells[6] != self.token && !board.taken?("4")
						"4"
					elsif board.taken?("1") && board.cells[0] != self.token && board.taken?("4") && board.cells[3] != self.token && !board.taken?("7")
						"7"
					elsif board.taken?("4") && board.cells[3] != self.token && board.taken?("7") && board.cells[6] != self.token && !board.taken?("1")
						"1"
					elsif board.taken?("3") && board.cells[2] != self.token && board.taken?("9") && board.cells[8] != self.token && !board.taken?("6")
						"6"
					elsif board.taken?("3") && board.cells[2] != self.token && board.taken?("6") && board.cells[5] != self.token && !board.taken?("9")
						"9"
					elsif board.taken?("6") && board.cells[5] != self.token && board.taken?("9") && board.cells[8] != self.token && !board.taken?("3")
						"3"
					elsif board.taken?("7") && board.cells[6] != self.token && board.taken?("9") && board.cells[8] != self.token && !board.taken?("8")
						"8"	
					elsif board.taken?("7") && board.cells[6] != self.token && board.taken?("8") && board.cells[7] != self.token && !board.taken?("9")
						"9"
					elsif board.taken?("8") && board.cells[7] != self.token && board.taken?("9") && board.cells[8] != self.token && !board.taken?("7")
						"7"	
					else 
						outside_squares.select {|square| !board.taken?(square)}.sample
					end
			end
		
		end
	end
end
