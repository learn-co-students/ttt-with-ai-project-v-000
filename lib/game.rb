class Game

	WIN_COMBINATIONS = [[0,4,8], [6,4,2], [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8]]

	attr_accessor :board, :player_1, :player_2

		# Originally tried to make the initialize arguments keywords, but one test would not
		# pass if this was the case.
	 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
	 	@board = board
			# Computer instance will need access to WIN_COMBINATIONS (via move(board)) to make decisions
			# on how to move.  This passes WIN_COMBINATIONS to board instance.
		board.win_combinations = self.class::WIN_COMBINATIONS
		@player_1 = player_1
	 	@player_2 = player_2
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
					#PROBLEM with the test here: I keep getting it right with combo 0, 4, 8.  But this
					# test here has two combos winning.  It expects 2, 5, 8 to be the winning combo.
					# Had to move the combos around to make this work.
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
		board.cells[box.to_i - 1] = current_player.token
		board.display
		puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
	end

	def play
		board.display
		turn until over?
		puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
		winner #made winner the return value to help in wargames mode
	end

end
