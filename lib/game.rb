require_relative 'board.rb'
require_relative 'player.rb'

class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

	def initialize(num_of_players)
		@board = Board.new
		if num_of_players == "0"
			@player_1 = Player::Computer.new("X")
			@player_2 = Player::Computer.new("O")
		elsif num_of_players == "1"
			@player_1 = Player::Human.new("X")
			@player_2 = Player::Computer.new("O")
		elsif num_of_players == "2"
			@player_1 = Player::Human.new("X")
			@player_2 = Player::Human.new("O")
		end
	end

	def current_player
		@board.turn_count%2 == 0 ? @player_1 : @player_2
	end

	def won?
		# Finds indexes of X and O to find 
	    x_indexes, o_indexes = [], []
	    for i in 0...9
	    	x_indexes.push(i) if board.cells[i] == "X"
	    	o_indexes.push(i) if board.cells[i] == "O"
	    end

      	# Checks each win_combination and checks the X or O indexes to see if either has winning combination
		# If the matches include a win_combination, that combination is returned, otherwise false is returned.

		WIN_COMBINATIONS.each { |win_combination|
		  if win_combination.all?{|i| x_indexes.include?(i)} == true
		    return win_combination
		  elsif win_combination.all? {|i| o_indexes.include?(i)} == true
		    return win_combination
		  end
		}

		# Returns false if it did not find a win_combination
		return false
	end

	def winner
		
	end

	def start

	end

	def play
		
	end

	def turn
		
	end

end