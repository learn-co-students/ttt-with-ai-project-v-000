class Game
	attr_accessor :board
	attr_accessor :player_1
	attr_accessor :player_2

	WIN_COMBINATIONS = [
		[0, 1, 2],
		[0, 3, 6],
		[0, 4, 8],
		[1, 4, 7],
		[2, 5, 8],
		[2, 4, 6],
		[3, 4, 5],
		[6, 7, 8]
	]

	def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end	

	def current_player
		@board.cells.select {|cell| cell != " "}.count % 2 == 0 ? @player_1: @player_2
	end

	def over?
		self.won? || self.draw?
	end

	def won?
		WIN_COMBINATIONS.detect {|combo|
			pos_1 = @board.cells[combo[0]]
			pos_2 = @board.cells[combo[1]]
			pos_3 = @board.cells[combo[2]]

			(pos_1 == "X" && pos_2 == "X" && pos_3 == "X" || pos_1 == "O" && pos_2 == "O" && pos_3 == "O") ? combo: false
		}
	end

	def draw?
		!self.won? && @board.full?
	end

	def winner
		won? ? @board.cells[won?[0]]: nil
	end

	def turn
		#input = self.current_player.move(@board)
		#@board.valid_move?(input) ? @board.update(input, self.current_player): turn
		input=self.current_player.move(board)
		puts input
		if board.valid_move?(input)
			board.update(input, current_player)
		else
			turn
		end
	end

	def play
		until self.over?
			self.turn
		end

		puts won? ? "Congratulations #{winner}!": "Cats Game!"
	end
end
