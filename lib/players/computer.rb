module Players

	class Computer < Player

		def move(board)
			move = " "

		# If computer plays first
			# first whatever happens try to take the middle
			if !board.taken?(5)
				move = "5"

			# then on round 3 (turn_count == 2) take a corner
			elsif board.turn_count == 2
				move = [1, 3, 7, 9].detect{|cell| !board.taken?(cell)}.to_s

		# If computer plays second (turn_count == 1)
			# will try to take the center anyway because conditional comes before

			# let's try to take a corner first (otherwise if middle is free, will go there since conditional comes before)
			elsif board.turn_count == 1
				move = "1"

			# as a second move
			elsif board.turn_count == 3 && ( board.position(1) == board.position(3) || board.position(7) == board.position(9) )
				move = "2"

			# Takes the WIN_COMBINATIONS array, looking for combinations where only one move is left to win
			else
				Game::WIN_COMBINATIONS.detect do |combination|

					two_owned 		= combination.select{|cell| board.position(cell+1) == self.token}.size == 2
					one_available 	= combination.any?	{|cell| board.position(cell+1) == " "}
					first_available = combination.select{|cell| !board.taken?(cell+1)}.first.to_i.+(1).to_s

					# check in each winning combination that there is an empty cell that can be played
					if two_owned && one_available
						move = first_available

					# If impossible to win, try to get a draw
					elsif combination.select{ |cell| board.position(cell+1) != " " && board.position(cell+1) != self.token }.size == 2 && one_available
						move = first_available
					end
				end

				# move to the empty spots from the combinations
				move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|cell| !board.taken?(cell)}.to_s if move == nil
			end

			move
		end

	end
end