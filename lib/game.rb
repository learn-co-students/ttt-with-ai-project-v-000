require 'pry'

class Game

	attr_accessor :board, :player_1, :player_2

  @@games_played = []
  @@games_won = []

  WIN_COMBINATIONS = [
	  [0,1,2], # Top row
	  [3,4,5], # Middle row
	  [6,7,8], # Bottom row
	  [0,3,6], # Left column
	  [1,4,7], # Middle column
	  [2,5,8], # Right column
	  [2,4,6], # Top right to bottom left
	  [0,4,8]  # Top left to bottom right
	]

	def initialize(player_1 = Human.new, player_2 = nil, board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

	# def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
	# 	@board = board
	# 	@player_1 = player_1
	# 	@player_2 = player_2
	# end

	# binding.pry


end

#rspec spec/04_game_spec.rb