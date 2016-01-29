require 'pry'


class Computer < Player

	@@current_move_count = 0
	@@went_first = 0
	def move(board)
		if board.cells[board.center[0]] == " "
			move = board.center[0].to_s
		end
	end

end