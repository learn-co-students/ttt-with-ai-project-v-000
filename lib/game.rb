class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
	]

	def initialize( player_1 = Players::Human.new("X"),
		              player_2 = Players::Human.new("O"),
		              board = Board.new )
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		@board.turn_count % 2 == 0 ? player_1 : player_2
	end

	def over?
		won? || draw?
	end

	def won?
		cells = @board.cells
		WIN_COMBINATIONS.detect do |combo| 
			cells[combo[0]] != " " &&
			  cells[combo[0]] == cells[combo[1]] &&
			  cells[combo[1]] == cells[combo[2]]
		end
	end

	def draw?
		@board.full? && !won?
	end

	def winner
		if won = won?
		  board.cells[won.first]
		end
	end

	def turn
		current_turn = ''
		while !@board.valid_move?(current_turn)
			print "\nInvalid move. " if current_turn != ''
		  current_turn = current_player.move(@board)
		end
		@board.update(current_turn,current_player)
	end

	def play
		@board.display

		while !over?
			turn
			@board.display
		end

		if draw?
			puts
			puts "Cats Game!"
		else
			puts
			puts "Congratulations #{winner}!"
		end
	end

end