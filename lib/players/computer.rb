module Players
	class Computer < Player
		
    
		def move(game)
			#return the ultimate position based on the Minimax algorithm
			# @temperary_board = game.board.cells#

	  end

		# def minimax(game)
		# 	return score if game.over?
		# 	scores = [] #An array of the scores
		# 	moves = [] #an array of the moves
      
		# 	#Populate the scores array, recusing as needed
		# 	game.available_moves.each do |move|
		# 		possible_game = game.get_new_state(move)
  #       scores << minimax(possible_game)

		# 	end

		# end

    
		# def score
		#   #@player is the turn taking player
		# 	@player = game.current_player 
  #     @opponent = @player != "X" ? "X" : "O"

		# 	if game.winnr == @player
		# 		return +10
		# 	elsif game.winnr == @opponent
		# 	  return -10
		# 	else
		# 	  return 0
		# 	end    	
		# end

  end
end