require 'pry'

class Game
	
	attr_accessor :board, :player_1, :player_2
	
	WIN_COMBINATIONS = [
	  [0,1,2], # Top row
	  [3,4,5],
	  [0,3,6],# Middle row
	  [6,7,8],  # Bottom row
	  [0,4,8],  # First column
	  [1,4,7], # Second column
	  [2,5,8], #Third column #Diagonal column
	  [2,4,6], #Diagonal column
	]
	

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def turn_count
		counter = 0
		board.cells.each do |turn|
			if turn == "X" || turn == "O"
				counter +=1
			end
		end
		counter		
	end

	def current_player		
		if self.turn_count.even? == TRUE
			player_1
		else
			player_2
		end
	end

	def over?
		won? || draw?
	end

	def won?
		WIN_COMBINATIONS.detect do |combo|
	    		win_index1 = combo[0]
			    win_index2 = combo[1]
			    win_index3 = combo[2]

			    position_1 = board.cells[win_index1]
			    position_2 = board.cells[win_index2]
			    position_3 = board.cells[win_index3]

			    (position_1 == "X" && position_2 == "X" && position_3 == "X") || 
			    (position_1 == "O" && position_2 == "O" && position_3 == "O")
		 end
  		
	end

	def full?
  		if board.cells.all? {|full| full == "X" || full == "O"}
    		true
  		else
    		false
  		end
	end

	def draw?
  		
  		board.full? && !won? 

	end	

	def winner
		

  		WIN_COMBINATIONS.each do |combo|
    		win_index1 = combo[0]
		    win_index2 = combo[1]
		    win_index3 = combo[2]

		    position_1 = board.cells[win_index1]
		    position_2 = board.cells[win_index2]
		    position_3 = board.cells[win_index3]

		    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
		       return "X"
		    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
		        return "O"
		    
    		end
  		end
  			return nil
	end


	def turn  		  		
		
		player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end

	end

	def play
	    #puts "Welcome to tic tac toe!"
      while !over?
	      turn
	    end
	    if won?
	      puts "Congratulations #{winner}!"
	    elsif draw?
	      puts "Cat's Game!"
	    end
  end

end
