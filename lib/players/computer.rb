class Players::Computer < Player

	# USES 1-9 POSITIONS

	def move(board)

		# First move always in the center, if possible.
		if !board.taken?(5)
			"5"
		# If you go second and center is taken, go Position 1.
		elsif board.turn_count == 1
			"1"
		# If you went first and took center, try the corners.
		elsif board.turn_count == 2
			[1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

		end

	end

end






#	def move(board)
#		i = 3
#		if board.valid_move?(i)
#			i.to_s
#		else
#			i += 2 unless i == 9
#		end
#
#	end
#
#end

# MY COMPUTER PLAYER ONLY TAKES 2 TURNS AND THEN ENTERS INFINITE