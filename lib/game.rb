require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'players/human.rb'
require_relative 'players/computer.rb'

class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
		[0,1,2], [3,4,5], [6,7,8],	# horizontal wins
		[0,3,6], [1,4,7], [2,5,8],	# vertical wins
		[0,4,8], [6,4,2]			# diagonal wins
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
		WIN_COMBINATIONS.detect { |combo| 
			@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
		}
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
		move = current_player.move(@board)

		until @board.valid_move?(move)
			move = current_player.move(@board)
		end

		@board.update(move, current_player)
	end

	def play

		until over?
			puts "\n#{current_player.token}'s turn.\n"
			@board.display

			turn
			break if won? || draw?
		end

		puts
		puts "Congratulations #{winner}!" if won?
		puts "Cats Game!" if draw?
		puts
		@board.display
		puts
	end

end
