class Computer < Player
	attr_accessor :name

	@potential_winners = []

	def first_round?(board)
		board.cells.count(token) == 0 ? true : false
	end

	def random_move(board)
  	['1','2','3','4','5','6','7','8','9'][rand(board.cells.length)] #non AI, random move
	end

	def opp_token
		self.token == "X" ? "O" : "X" 
	end

	def potential_winning_set?(board,token_1,token_2)
		@potential_winners=[]
		Game::WIN_COMBINATIONS.each do |set|
    	if (board.cells[set[0]] == token_2 || #any equals non-player token
    		 board.cells[set[1]] == token_2 ||
    		 board.cells[set[2]] == token_2) &&
    		 (board.cells[set[0]] != token_1 && #none equals player token
    		 	board.cells[set[1]] != token_1 &&
    		 	board.cells[set[2]] != token_1) 
    		@potential_winners << set
    	end
    end

  	@potential_winners = @potential_winners.flatten.uniq
  	@potential_winners.each do |move|
  		if board.cells[move] == token_2
  			@potential_winners.delete(move)
  		end
  	end
  	return @potential_winners
	end

	def potential_moves_matches(off_moves,def_moves,board)
		off_moves.each do |move|
			if def_moves.detect(move)
				move+=1
				move = move.to_s
				return move
			end
		end
	end

	#is a potential move a winning move?
	def winning_move?(temp_board, board, temp_token)
		Game::WIN_COMBINATIONS.detect do |set|
      temp_board[set[0]] == temp_board[set[1]] &&
      temp_board[set[1]] == temp_board[set[2]] &&
      temp_board[set[0]] == temp_token
    end
  end

  def ai_moves(player_moves,board,token)
  	temp_board = board.cells.clone
		move=0
		9.times do |move|
			until temp_board[move] == " " || move == 9
				move+=1
			end
			temp_board[move] = token
			temp_token = token
			if winning_move?(temp_board, board, temp_token) != nil
				return move+1
			end
			temp_board = board.cells.clone
			move+=1
		end
		false
  end

	def move(board)
		#begin game with random move
		if first_round?(board)
			rand_move = random_move(board)
			return rand_move
		end

		####AI moves####
		#if player has a winning move, then take it
		off_moves = potential_winning_set?(board,opp_token,token) #test
		ai_move = ai_moves(off_moves,board,token)
		return ai_move if ai_move != false

		#if player has no winning move, but opponent does, then block the opponent
		def_moves = potential_winning_set?(board,token,opp_token) #test
		ai_move = ai_moves(def_moves,board,opp_token)
		return ai_move if ai_move != false

		#if neither player has a winning move, then find matching positions for winning moves
		#to improve players chances and decrease opponents
		ai_move = potential_moves_matches(off_moves,def_moves,board)
		return ai_move if ai_move != []

		#if no winning strategy is found, then move on random open position
		return random_move(board)
	end
end