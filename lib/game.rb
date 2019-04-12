require 'pry'

class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

	def board
		@board
	end

	def initialize(player_1 = Players::Human.new("X", name), player_2 = Players::Human.new("O", name), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		self.board.turn_count.even? ? @player_1 : @player_2
	end

	def over?
		draw? || won?
	end

	def won?
		WIN_COMBINATIONS.find do |com| # [0,1,2]
			self.board.cells[com[0]] == self.board.cells[com[1]] &&
			self.board.cells[com[1]] == self.board.cells[com[2]] &&
			self.board.taken?(com[0] + 1)
		end
	end

	def draw?
		!won? && self.board.full?
	end

	def winner
		if com = won?
			self.board.cells[com[0]]
		end
	end

	def turn
		player = current_player
		current_move = player.move(board)
			self.board.display
			if !self.board.valid_move?(current_move)
				puts current_move
				puts "That is not a valid move."
				turn
			else
				puts "Turn: #{self.board.turn_count + 1}\n\n"
				self.board.display
				self.board.update(current_move, player)
				puts "#{player} moved to Position #{current_move}.\n\n"
				self.board.display
				play
				exit
			end
	end

	def play
		while !over?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cats Game!"
		end
	end

end