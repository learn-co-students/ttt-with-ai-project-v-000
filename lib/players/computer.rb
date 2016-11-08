require 'pry'
module Players
	class Computer < Player

    #return a string of the ultimate position based on the Minimax algorithm
		def move(parameter)
			  

				@temperary_board = @game.board.cells
				@player = @game.current_player.token
				@opponent = @player != @game.player_1.token ? @game.player_1.token : @game.player_2.token
				@choice = nil
        @depth = 0
       
				self.minimax

        @game.board.cells = @temperary_board
	      "#{@choice}"

	  end

		def minimax
			  
				return self.score if @game.over?
        # @depth += 1
				board_state_before_change = @game.board.cells.clone
				scores = [] #An array of the scores
				moves = [] #an array of the moves
				#Populate the scores array, recusing as needed
				available_moves = @game.get_available_moves
				available_moves.each do |move| 
						@game.board.cells = board_state_before_change.clone
						possible_game = @game.get_new_state(move)
		        scores << minimax
		        moves << move   
				end
	      
	      @game.board.cells = board_state_before_change
				# Do the min or the max calculation
		    if @game.current_player.token == @player
	        # This is the max calculation
	        max_score_index = scores.each_with_index.max[1]
	        @choice = moves[max_score_index]
	        return scores[max_score_index]
		    else
		      # This is the min calculation
		      min_score_index = scores.each_with_index.min[1]
		      @choice = moves[min_score_index]
		      return scores[min_score_index]
		    end
		end
   
		def score
				if @game.winner == @player
				   10 
				elsif @game.winner == @opponent
				   -10
				else
				   0
				end    	
		end

  end
end