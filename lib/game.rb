require 'pry'

class Game

	WIN_COMBINATIONS = [[0,4,8], [6,4,2], [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8]]

	attr_accessor :board, :player_1, :player_2

	def initialize(player_1 = nil, player_2 = nil, board = nil)

			# MAKE THESE SYMBOLS...SO YOU CAN DO THE = THINGS AND ORDER DOESN'T MATTER...

			# had to put the "= nil"s above b/c each argument seems optional...the tests are giving me a hard time if I have arguments and then if I don't have arguments...

		!board ? @board = Board.new : @board = board

		!player_1 ? @player_1 = Players::Human.new("X") : @player_1 = player_1

		# @player_1.board = @board

		# if !player_1
		# 	@player_1 = Players::Human.new("X")
		# elsif player_1.class == Players::Computer
		# 	#puts "Computer Class!
		# 	player_1.board = @board
		# end


		!player_2 ? @player_2 = Players::Human.new("O") : @player_2 = player_2

		# @player_2.board = @board
	end

  def turn_count
		board.cells.count { |square| square != " " }
  end

  def current_player
		turn_count.even? ? player_1 : player_2
  end

	def won?
		winning_combo = nil
		WIN_COMBINATIONS.each do |combo|
			if board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
				winning_combo = combo
					#PROBLEM with the test here: I keep getting it right with combo 0, 4, 8.  But this test here has two combos winning.  It expects 2, 5, 8 to be the winning combo.  Have to move the combos around to make this work.
			end
		end
		winning_combo
	end

	def full?
  	board.cells.all? { |cell| cell != " " }
	end

	def draw?
		full? && !won?
	end

  def over?
  	 won? || draw?
 	end

	def winner
		won? ? board.cells[won?[0]] : nil
	end

	def turn
 		box = current_player.move(board)
		if valid_move?(box)
 			board.cells[box.to_i - 1] = current_player.token
 		else
 			puts "invalid"
 			turn
 		end
 	end

 	def valid_move?(num)
 		tester = num.to_i - 1
 		tester.between?(0,8) && board.cells[tester] == " "
	end

	def play
		turn until over?
		puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
	end

end
