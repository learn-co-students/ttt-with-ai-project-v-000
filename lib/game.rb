require 'pry'

class Game

	attr_accessor :board, :player_1, :player_2

  @@games_played = []
  @@games_won = []

  WIN_COMBINATIONS = [
	  [0,1,2], # Top row
	  [3,4,5], # Middle row
	  [6,7,8], # Bottom row
	  [0,3,6], # Left column
	  [1,4,7], # Middle column
	  [2,5,8], # Right column
	  [2,4,6], # Top right to bottom left
	  [0,4,8]  # Top left to bottom right
	]

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

	def current_player
		if self.board.turn_count % 2 == 0
			player_1
		else
			player_2
		end	
	end

	def over?
		won? || draw?
	end

	def won?
		WIN_COMBINATIONS.each do |combo|
			win_index_1 = combo[0]
	    win_index_2 = combo[1]
	    win_index_3 = combo[2]

	    position_1 = board.cells[win_index_1]
	    position_2 = board.cells[win_index_2]
	    position_3 = board.cells[win_index_3]

	    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
	      return combo
	    end
		end
		nil
	end

	def draw?
		!won? && board.full?
	end

	def winner
		won? ? board.cells[won?.first] : nil
	end

	def turn
		position = current_player.move(board, self)
		if board.valid_move?(position)
			board.update(position, self.current_player)
			board.display
		else
			turn
		end
	end

	def play
		while board.turn_count < 9 && !over?
			turn
		end
		if over?
			case draw?
			when true
				puts "Cats Game!"
			when false
				puts "Congratulations #{winner}!"
			end
		end
	end



	# binding.pry


end

#rspec spec/04_game_spec.rb



