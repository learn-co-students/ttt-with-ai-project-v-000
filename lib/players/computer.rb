class Players::Computer < Player

	# USES 1-9 POSITIONS

	def move(board)

		move = nil

		# First move always in the center, if possible.
		if !board.taken?(5)
			move = "5"
		# If you go second and center is taken, go Position 1.
		elsif board.turn_count == 1
			move = "1"
		# If you went first and took center, try the corners.
		elsif board.turn_count == 2
			move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

		# If you went second and the other guy has opposite corners, go side.
		elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
			move = "2"

		# Go through WIN_COMBINATIONS to see whether you or other guy has any with two positions and the remaining empty.
		else 
			Game::WIN_COMBINATIONS.detect do |com|

			# Check whether you have a winner.
			if com.select {|i| board.position(i + 1) == token}.size == 2 && com.any? {|i| board.position(i + 1) == " "}
				 move = com.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

			# If you don't have winner, block any winners other guy has.
			elsif com.select {|i| board.position(i + 1) != " " && board.position(i + 1) != token}.size == 2  && com.any? {|i| board.position(i + 1) == " "}
					move = com.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
			end
		end

		# If neither of you have a winner, look to play corner, then side.
		move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|i| !board.taken?(i)}.to_s if move == nil
		end
		move				
	end
end