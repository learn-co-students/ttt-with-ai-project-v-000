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
		if won_by = won?
			board.cells[won_by.first]
		end
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

end