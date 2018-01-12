class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4, 6]
	]

	def initialize(player_1 = nil, player_2 = nil, board = nil)
		if player_1 == nil && player_2 == nil && board == nil
			@player_1 = Players::Human.new("X")
			@player_2 = Players::Human.new("O")
			@board = Board.new
		else
			@player_1 = player_1
			@player_2 = player_2
			@board = board
		end
	end

	def current_player
		self.board.turn_count.even? ? player_1 : player_2
	end

	def over?
		draw? || won?
	end

	def won?
		won_combo = nil

		WIN_COMBINATIONS.each do |combo|
			position_1 = self.board.cells[combo[0]]
			position_2 = self.board.cells[combo[1]]
			position_3 = self.board.cells[combo[2]]

			if position_1 == "X" && position_2 == "X" && position_3 == "X"
				won_combo = combo
				break
			elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
				won_combo = combo
				break
			end
		end
		won_combo
	end

	def draw?
		self.board.full? && !won?
	end

	def winner
		won? ? self.board.cells[won?[0]] : nil
	end

	def turn
		self.board.update(self.current_player.move, current_player)
	end

	def play
		until over?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cat\'s Game!"
		end
	end

end