require_relative 'board.rb'
require_relative 'player.rb'

class Game
	attr_accessor :board, :player_1, :player_2

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
		
	end

	def won?
		
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