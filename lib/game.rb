require 'pry'

class Game
	attr_accessor :player_1, :player_2, :board

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

	 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		 @player_1 = player_1
		 @player_2 = player_2
	   @board = board
	 end

# # a game has one board  (like Pet has one owner)
# # board and player do not relate directly, but they collaborate through arguments
# # game provide s basic game runtime and logic
#
# # NEED HELP ON THIS
	 def current_player(board)
		 #why is this not working?
		 @board.turn_count.even? ? @player_1 : @player_2
	 end

	 def over?
		  won || draw
 	 end

	 #
	 #
	#  def won?
	# 	 # cells = any of the winning combos
	# 	# game.board.cells --
	# 	#WIN_COMBINATIONS.detect
	# 		#detect what -- board cells with WIN_COMBINATIONS
	# 		#how?
	#   end


	 def draw?
		!won && @board.full
	#		if cells are full, but no winning combo, use board.full
	 end

	 def winner
		 	#if winning combo and ..last player, or first to get to Win_combos?
			# if WIN_COMBINATIONS = won
			# 	@board[WIN_COMBINATIONS.first]??
	 end

	 def start
		 play
		 #what else
	 end

	#  def play
	# 	 #puts"Where would like to move?"
	# 	#input = gets.strip
	# 	 #uses board methods to place it
	# 	 while !over?
	# 	 		turn
	#    end
	#  	if won?
	# 	 	puts "Congratulations #{winner}!"
	#  	else
	# 	 	puts "Cat's Game"
	# 	end
	#  end

	#  def turn
	# 	 if !over?
	# 		 #current_player switches
	# 	# @cells.any have an X, switch to O
	# 	#last play was o, switch to X
	# 		# how do i figure out whose play was last?
	# 		# use current_player?
	# 		#puts"Player #{ }'s turn"
	# 	 #
	#  end
	# end


end
