module Players
	class Computer < Player

		def move(board)
			position = nil
			if board.cells[0] == " "
				position = 1
			elsif board.cells[1] == " "
				position = 2
			elsif board.cells[2] == " "
				position = 3
			elsif board.cells[3] == " "
				position = 4
			elsif board.cells[4] == " "
				position = 5
			elsif board.cells[5] == " "
				position = 6
			elsif board.cells[6] == " "
				position = 7
			elsif board.cells[7] == " "
				position = 8
			elsif board.cells[8] == " "
				position = 9
			end
			position.to_s
		end
	end
end