class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom row
    [0, 3, 6],  # Left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],  # Right column
    [0, 4, 8],  # Left diagonal
    [6, 4, 2]   # Right diagonal
	]

	def initialize(player_1 = nil, player_2 = nil, board = nil)
		@player_1 = player_1 || Players::Human.new("X")
		@player_2 = player_2 || Players::Human.new("O")
		@board = board || Board.new 
	end

	def current_player
		board.turn_count.even? ? player_1 : player_2
	end

	def won?
		WIN_COMBINATIONS.detect do |combination|
			board.taken?(combination[0] + 1) &&
			board.cells[combination[0]] == board.cells[combination[1]] &&
			board.cells[combination[1]] == board.cells[combination[2]]
		end
	end

	def draw?
		board.full? && !won?
	end

	def over?		
		won? || draw?
	end

	def winner
		won_by = won?
		board.cells[won_by.first] if won_by
	end

	def turn
		input = current_player.move(board)

		if board.valid_move?(input)
			board.update(input, current_player)
			board.display
			puts
		else
			turn
		end
	end

	def play
		until over?
			puts "Turn: #{board.turn_count}"
			puts "#{current_player.token}'s move"
			turn
		end

		if won?
			puts "Congratulations #{winner}!"
		else
			puts "Cat's Game!"
		end
	end

	def play_again
		input = ""
		until input =~ /y|n/i
			print "\nWould you like to play again? [y/n]: "
			input = gets.chomp
		end

		input == "y" ? self.class.start : abort
	end

	def self.start
		game_type = ""
		until game_type =~ /0|1|2/
			puts "\nWhat kind of game would you like to play?"
			puts " -- Enter 0 for Computer vs Computer"
			puts " -- Enter 1 for Human vs Computer"
			puts " -- Enter 2 for Human vs Human"
			print "\nGame Type: "
			game_type = gets.chomp
			puts
		end

		case game_type
			when "0"
				player_1 = Players::Computer.new("X")
				player_2 = Players::Computer.new("O")
				self.game_setup(player_1, player_2)
			when "1"
				print "Who goes first? [1 = Human | 2 = Computer]: "
				player = gets.chomp
				puts

				if player == "1"
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
				else
					player_1 = Players::Computer.new("X")
					player_2 = Players::Human.new("O")
				end
				self.game_setup(player_1, player_2)
			when "2"
				self.game_setup
		end
	end

	def self.game_setup(player_1 = nil, player_2 = nil)
		game = Game.new(player_1, player_2)
		game.board.display
		puts
		game.play
		game.play_again if game.over?
	end

end