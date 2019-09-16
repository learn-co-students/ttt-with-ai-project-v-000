class Game
	attr_accessor :player_1, :player_2, :board, :x, :o
	
	WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[2,5,8],[1,4,7],[2,4,6],[3,4,5],[6,7,8]]

	def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board

		puts "Welcome to Tic Tac Toe!"
		@board.display
		
	end

	def board
		@board
	end

	def current_player
		@board.turn_count.even? ? @player_1 : @player_2
	end

	def over?
		(draw? || won?) ? true : false
	end

	def won?
		
		x_arr = []
		# [0,2,4,7,8]
		o_arr = []
		# [1,3,5,6]

		@board.cells.each_with_index do |cell, index|
			if cell == "X"
				x_arr << index
			elsif cell == "O"
				o_arr << index
			end
		end
		
		WIN_COMBINATIONS.each do |combo|
			if (combo-o_arr).empty? 
				@o = true
				# puts "O wins"
				return combo
			elsif (combo-x_arr).empty?
				@x = true
				# puts "X wins"
				return combo
			end
		end

		return false
	end
	
	def draw?
		if won?
			return false
		end
		@board.cells.count{|c| c== " "} == 0
	end

	def winner
		if won?
			@x ? "X" : "O" 
		end
	end

	def turn
		move = self.current_player.move(@board)
		while !@board.valid_move?(move)
			puts"Invalid move, try again"
			move = current_player.move(@board)
		end
		@board.update(move, self.current_player)
		@board.display
	end

	def play
		
		while !over?
			turn
			if won?
				break
			elsif draw?
				break
			end
		end

		if won?
			puts "Congratulations #{winner}!"
		else
			puts "Cat's Game!"
		end
	end

end




# ruby bin/tictactoe
