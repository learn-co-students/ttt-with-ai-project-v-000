module Players
  class Computer < Player
		def move(board)
			move = nil
			if board.cells.all?{|cell| cell == " "}
				move = "1"
			elsif board.cells[2] == " "
				move = "3"
			elsif board.cells[6] == " "
				move = "7"
			elsif board.cells[8] == " "
				move = "9"
			end
			move
		end
	end
end
