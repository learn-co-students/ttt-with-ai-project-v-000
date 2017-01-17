class Game
	attr_accessor :board, :player_1, :player_2
	def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

	WIN_COMBINATIONS = [
		[0, 1, 2], # Top row
		[3, 4, 5], # Middle row
		[6, 7, 8], # Bottom row
		[0, 3, 6], # Left column
		[1, 4, 7], # Middle column
		[2, 5, 8], # Right column
		[2, 4, 6], # Diagonal 1
		[0, 4, 8]  # Diagonal 2
	]

	def current_player
		@board.turn_count % 2 == 0 ? @player_1 : @player_2
	end

	def move(index, playa)
    @board[index.to_i-1] = playa
  end

	def full?
    @board.cells.all? do |megatron|
      megatron == "X" || megatron == "O"
    end
  end

	def won?
		WIN_COMBINATIONS.detect do |wincombo|
			@board.cells[wincombo[0]] == @board.cells[wincombo[1]] &&
			@board.cells[wincombo[1]] == @board.cells[wincombo[2]] &&
			@board.taken?(wincombo[0]+1)
		end
	end

  def draw?
    !won? && full?
  end
	def over?
    won? || full? || draw?
	end

	def winner
		winface = won?
		if won?
			return @board.cells[winface[0]]
		else
			return nil
		end
  end

	def turn
		binding.pry
		puts "Please enter 1-9:"
		input = gets.strip
		if valid_move?(input)
			move(input, current_player)
			board.display
		else
			turn
		end
	end
end
