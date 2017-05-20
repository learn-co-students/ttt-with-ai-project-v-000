module Players

  class Human < Player
    def move(board)
 	    board.display
 	    puts "Please choose a move."
 	    gets.strip 
 	  end
 	end
end