class Game
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		board.turn_count.even? ? player_1 : player_2
	end

	def draw?
		board.draw?
	end

  def won?
    board.won?
  end

  def over?
    won? || draw? || board.full?
  end

  def winner
    winning_combo = won?
    winning_combo ? board.cells[winning_combo[0]] : nil
  end

	def turn
		move_choice = current_player.move(board)
		if board.valid_move?(move_choice)
		  puts "The computer player(\"#{current_player.token}\") chooses position #{move_choice}" if current_player.class == Players::Computer
			board.update(move_choice,current_player)
			board.display
		else
			self.turn
		end
	end

	def play
		puts "#{current_player.token} starts."
		while !self.over?
		 	self.turn
		end

		if self.draw?
			puts "Cat's Game!"
		else
			puts "Congratulations #{self.winner}!"
		end
	end

end
