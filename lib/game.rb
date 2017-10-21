

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
		[6,4,2] 
	]

	def board=(board)
		@board = []
	end	

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 =  player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		if board.turn_count % 2 == 0 
			return @player_1
		else @player_2
		end
	end

	def over?
		won? || draw?
		
	end

	def won?
		WIN_COMBINATIONS.each  { |win_combo|
				win_index_1 = win_combo[0]
				win_index_2 = win_combo[1]
				win_index_3 = win_combo[2]

				pos_1 = @board.cells[win_index_1]
				pos_2 = @board.cells[win_index_2]
				pos_3 = @board.cells[win_index_3]

				if  ((pos_1 == "X") && (pos_2 == "X") && (pos_3 == "X")) || ((pos_1 == "O") && (pos_2 == "O") && (pos_3 == "O"))
					return [win_index_1, win_index_2, win_index_3]
				end
			}
			return false
	end

	def draw?
		if @board.cells.all? { |position| (position == "X") || (position == "O")} && (won? == false)
			true
		elsif won? != false
			false
		else
			false
		end
	end
	
	def winner
		 winning_combo = won?
    	 @winner = @board.cells[winning_combo.first] if winning_combo
  	end

  	def turn
     player = current_player
     current_move = player.move(@board)
     if @board.valid_move?(current_move)
       @board.update(current_move, player)
       @board.display
     else
       turn
     end
   end

   def play
   	turn until over?

   	if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts 'Cats Game!'
     end
   end
 
 

			














end