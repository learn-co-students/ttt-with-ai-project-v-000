module Players
	class Computer < Player
		
		attr_reader :best_choice


		def move(board)
			minmax(board, token)
		end

		def minmax(board, token)
			#return score(board) if game.over?

			scores = {}

			#define an available space as an array
			board.available_spaces = []
			board.cells each do |cell|
				if valid_move?(cell)
					board.available_spaces << cell
				end
				board.available_spaces
			end

			board.available_spaces.each do |space|
				# Copy board so we don't mess up original
				potential_board = board.dup
				potential_board.update(space, token)

				scores[space] = minmax(potential_board, switch(token))
			end
			@best_choice, best_score = best_move(token, scores)
			best_choice
		end

		def best_move(token, scores)
			if token == @token
			  scores.max_by { |_k, v| v }
			else
			  scores.min_by { |_k, v| v }
			end
		end

		def score(game)
			if game.winner == token
			  return 10
			else
			  return -10
			end
		0
		end

		def switch(token)
			token == 'X' ? 'O' : 'X'
		end 

		# def move(board) #EASY MODE
	 	#   ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select {|position| board.valid_move?(position)}.sample
		# end #end method

	end #end class
end #end module