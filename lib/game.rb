class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		[0, 1, 2], 
		[3, 4, 5], 
		[6, 7, 8], 
		[0, 4, 8], 
		[6, 4, 2], 
		[0, 3, 6], 
		[1, 4, 7], 
		[2, 5, 8]   
	]

	def start
		puts "Would you like to play a 0, 1, or 2 player game? (0, 1, 2)"
		input = gets.strip
		if input.to_i == 0
			@player_1 = Player::Computer.new("X")
			@player_2 =  Player::Computer.new("O")
			play
		elsif input.to_i == 1
			puts "Would you like to be X or O?"
			token = gets.strip.downcase
			if token.to_s == "x"
				@player_2 = Player::Computer.new("O")
				play
			else
				@player_1 = Player::Computer.new("X")
				play
			end
		#elsif input.to_i == wargames
		#	player_1 = Player::Computer.new("X")
		#	player_2 = Player::Computer.new("O")
		#	wargames_play
		else
			play
		end
	end

	def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
		self.board = board
		self.player_1 = player_1 
		self.player_2 = player_2 
	end

	def current_player
		@board.turn_count % 2 == 0 ? @player_1 : @player_2
	end

	def won?
		WIN_COMBINATIONS.each {|win_combination|
		 	win_index_1 = win_combination[0]
		    win_index_2 = win_combination[1]
		    win_index_3 = win_combination[2]

		    position_1 = @board.cells[win_index_1]
		    position_2 = @board.cells[win_index_2]
		    position_3 = @board.cells[win_index_3]

		    	if ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")) || ((position_1 == "O") && (position_2 == "O") && (position_3 == "O"))
		    		return [win_index_1, win_index_2, win_index_3]
		    	end
    	}
    	return false
  	end

	def draw?
		if @board.cells.all? {|position| (position == "X") || (position == "O")} && (won? == false)
		  	true
		elsif (won? != false)
		  	false
		else
		  	false
		end
	end


  	def over?
  		won? != false || draw? == true
	end

	def winner
		if won? != false
			token = won?[0]
			winner = @board.cells[token]
			if winner == "X"
				return "X"
			elsif winner == "O"
				return "O"
			else
				nil
			end
		end
	end

	def turn
		position = current_player.move(@board)
		if @board.valid_move?(position)
			@board.update(position, current_player)
		else
	    	puts "Invalid move. Please try again."
	    	position = current_player.move(@board)
	    end
	    @board.display
	end

	def play
		turn until over?
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
    		puts "Cats Game!"
		end
	end

	#def wargames_play
	#	count = 0
	#	winner_x_count = 0
	#	winner_o_count = 0
	#	draw_count = 0
	#	until count == 100
			
	#		turn until board.cells.all? {|cell| board[cell].taken?}
	#		if board.cells.all? {|cell| board[cell].taken?}
	#			if winner == "X" 
	#				winner_x_count += 1
	#			elsif winner == "O"
	#				winner_o_count += 1
	#			elsif draw?
	#				draw_count += 1
	#			end
	#			count += 1
	#		end
	#		Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
	#	end
	#	puts "X won #{winner_x_count} time(s)!"
	#	puts "O won #{winner_o_count} time(s)!"
	#	puts "The was/were #{draw_count} Cat's Game(s)!"
	#end

end