class Game
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
	def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), board=Board.new)
		@player_1 = player1
		@player_2 = player2
		@board = board
	end

	def current_player
		if @board.turn_count % 2 == 0
			return @player_1
		else return @player_2
		end
	end

	def over?
		if won? || draw?
			return true
		else return false
		end
	end

	def won?
		WIN_COMBINATIONS.each do |win_combo|
			if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
				return win_combo
			elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
				return win_combo
			end
		end
		false
	end

	def draw?
		if @board.full? && !won?
			return true
		else return false
		end
	end

	def winner
		if won?
			win_combo = won?
			@board.cells[win_combo[0]]
		else nil
		end
	end

	def turn
		start_player = current_player
		while start_player == current_player
			move = current_player.move(@board)
			@board.update(move, current_player)
		end
	end

	def play
		while !over?
			turn
		end
		if draw?
			puts "Cat's Game!"
		elsif won?
			puts "Congratulations #{winner}!"
		end
	end

	def self.start
		puts "Hello user. Welcome to tic tac toe."
		continue = "Y"
		while continue == "Y"
			puts "Would you like to play with 0, 1, or 2 players?"
			input = gets.strip
			if input == "0"
				game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
				game.play
			elsif input == "1"
				game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
				game.play
			elsif input == "2"
				game = Game.new
				game.play
			else puts "Invalid Entry. Please enter 0, 1, or 2."
			end
			puts "Would you like to play again? Y/N"
			continue = gets.strip.upcase
		end
	end
end