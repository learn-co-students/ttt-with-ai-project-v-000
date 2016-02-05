require 'pry'
class Game
	WIN_COMBINATIONS = [
											[0,1,2],
											[3,4,5],
											[6,7,8],
											[0,3,6],
											[1,4,7],
											[2,5,8],
											[0,4,8],
											[6,4,2]
											]
	DIVIDER = "===================\n"									
											
	attr_accessor :player_1, :player_2, :board
	attr_reader :the_winner
	
	def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end
	
	def current_player
		board.turn_count.even? ? player_1 : player_2
	end
	
	def over?
		#binding.pry
		won? ? true : draw?
	end
	
	def won?
		WIN_COMBINATIONS.any? do |combo|
			allsame?(combo, "X") || allsame?(combo, "O")
		end
	end
	
	def allsame?(array, token)
		if array.all? {|i| board.cells[i] == token}
			@the_winner = token
			true
		else
			@the_winner = nil
			false
		end
	end
	
	def draw?
		!board.full? ? false : !won?
	end
	
	def winner
		won? ? the_winner : nil
	end
	
	def turn
		input = current_player.move(board)
		if board.valid_move?(input) 
			board.update(input, current_player)
		else
			puts "\nInvalid move. Enter an open position from 1-9."
			display_turn
			turn
		end
	end
	
	def play
		while !over?
			display_turn
			turn
		end
		puts "\n" + DIVIDER
		draw? ? (puts "Cats Game!") : (puts "Congratulations #{winner}!")
		puts DIVIDER
		board.display
	end
	
	def display_turn
		puts "\n" + DIVIDER
		puts "  #{current_player.token}'s turn"
		puts DIVIDER
		board.display
	end
	
end
