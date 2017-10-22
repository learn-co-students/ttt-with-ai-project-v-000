module Players
	class Computer < Player

		WIN_COMBINATIONS =[
			     [0,1,2], # Top row
			     [3,4,5], # Middle row
			     [6,7,8], # Bottom row
			     [0,3,6], # Left Column
			     [1,4,7], # Middle Column
			     [2,5,8], # Right Column
			     [0,4,8], # Diagonal left to right
			     [2,4,6]  # Diagonal right to left
			   ]

		def move(board)
			position = nil
			
		if board.cells[4] == " "
			position = 5
		else
			WIN_COMBINATIONS.detect do |wincombo|
				wincombo.detect do |spot|
					x = spot.to_i
					if board.cells[x] == " "
						position = x + 1
					end
				end
			end
		end
			position.to_s
		end
	end
end
#if board.cells[0] == " "
			#	position = 1
			#elsif board.cells[1] == " "
			#	position = 2
			#elsif board.cells[2] == " "
			#	position = 3
			#elsif board.cells[3] == " "
			#	position = 4
			#elsif board.cells[4] == " "
			#	position = 5


#elsif board.cells[6] == " "
			#	position = 7
			#elsif board.cells[7] == " "
			#	position = 8
			#elsif board.cells[8] == " "
			#	position = 9
			#end