module Players
	class Computer < Player
    
		def move(board)
			#return the ultimate position based on the Minimax algorithm
			@temperary_board = @game.board.cells
	  end

		def minimax
			return self.score if @game.over?
			scores = [] #An array of the scores
			moves = [] #an array of the moves
      
			#Populate the scores array, recusing as needed
			@game.available_moves.each do |move|
				possible_game = @game.get_new_state(move)
        scores << minimax(possible_game)
        moves << move
			end

		end

    
		def score
		  #@player is the turn taking player
			@player = @game.board.turn_count % 2 == 0 ? @game.player_2.token : @game.player_1.token 
      @opponent = @player != @game.player_1.token ? @game.player_1.token : @game.player_2.token

			if @game.winner == @player
			  +10
			elsif @game.winner == @opponent
			  -10
			else
			  0
			end    	
		end

  end
end