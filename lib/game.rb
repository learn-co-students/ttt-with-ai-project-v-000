require_relative "../config/environment.rb"

class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2],
											[3,4,5],
											[6,7,8],
											[0,3,6],
											[1,4,7],
											[2,5,8],
											[0,4,8],
											[6,4,2]]

	#could be metaprogrammed to accept arguments in any order
	def initialize(player1_object=Players::Human.new("X"), player2_object=Players::Human.new("O"), board_object=Board.new)
		@player_1 = player1_object
		@player_2 = player2_object
		@board = board_object
	end

	def current_player
		if board.turn_count.even?
			player_1
		else
			player_2
		end
	end

	def other_player
		if board.turn_count.even?
			player_2
		else
			player_1
		end
	end

	def over?
		board.full? || self.won?
	end

	def won?
		self.winner == "X" || self.winner == "O"
	end

	def draw?
		board.full? && self.won? == false
	end

	def winner
		if WIN_COMBINATIONS.collect {|combo| combo.all? {|c| board.cells[c] == "X" }}.include?(true)
			"X"
		elsif WIN_COMBINATIONS.collect {|combo| combo.all? {|c| board.cells[c] == "O" }}.include?(true)
			"O"
		end
	end

	def turn
		input = ""
		until input.to_i >= 1 && input.to_i <= 9
 			input = current_player.move(board)
		end
		board.update(input, current_player)
		puts "#{board.display_guide}\n #{board.display}"
	end

	def play
		until over? || won? || draw?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cat's Game!"
		end
	end


	# def winning_line
	# 	winning_index = WIN_COMBINATIONS.collect {|combo| combo.all? {|c| game.board.cells[c] == "X" }}.rindex(true)
	# 	WIN_COMBINATIONS[winning_index].collect{|i| i+1} #converts to user positions
	# end
end
