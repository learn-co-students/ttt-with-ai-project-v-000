class Players::Computer < Player

	def move(board)
		!board.taken?('5') ? '5' : best_move(board) + 1
	end


end