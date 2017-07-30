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

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end 

	def current_player
		# true --> player_1
		# false --> player_2
		@board.turn_count.even? ? player_1 : player_2 
	end

	def turn
		move = current_player.move(board)
		if board.valid_move?(move)
			board.update(move, current_player)
			move
			board.display
		else
			puts "Invalid move!"
			turn
		end
	end

	def won? # use the win combinations
		WIN_COMBINATIONS.find do |win_combination|
    		if (@board.cells[win_combination[0]]) == "X" && (@board.cells[win_combination[1]]) == "X" && (@board.cells[win_combination[2]]) == "X" || 
    			(@board.cells[win_combination[0]]) == "O" && (@board.cells[win_combination[1]]) == "O" && (@board.cells[win_combination[2]]) == "O"
      			return win_combination
      		else 
      			false
    		end
  		end
	
	end

	def draw? 
		@board.full? && !won?
	end

	def over?
		won? || draw?
	end

	def winner 
		if array = won?
    		@board.cells[won?[0]]
  		end
	end

	def play
		until over? 
			turn
 		end
	    if won?
	    	puts "Congratulations #{winner}!"
	    elsif draw?
	    	puts "Cat's Game!"
		end
		self.board.display
	end


end 