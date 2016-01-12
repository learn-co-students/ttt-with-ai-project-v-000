require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'players/human.rb'
require 'pry'

class Game
	attr_accessor :board, :player_1, :player_2

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

	def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
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
		  if win_combination.all?{|i| x_indexes.include?(i)} || win_combination.all? {|i| o_indexes.include?(i)}
		    return win_combination
		  end
		}

		# Returns false if it did not find a win_combination
		return false
	end

	def over?
		board.full? || won?
	end

	def draw?
		!won? && board.full?
	end

	def winner
		if won?
			return board.cells[won?[0]]
		end
	end

	def turn
		@board.update(current_player.move(@board), current_player)
	end

	def play

		until over?
			puts "#{current_player.token}'s turn."
			@board.display
			turn
			break if won? || draw?
		end

		puts "Congratulations #{winner}!" if won?
		puts "Cats Game!" if draw?
		
	end

end






