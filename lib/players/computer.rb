module Players
  class Computer < Player

    def move(board)
#      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#      valid_moves.sample

      first_move = 5 # This is the center spot
      next_best = [1,3,7,9]  # These are the corners
      move = nil
      
      #If the best move (5) not taken, make this move
      if !board.taken?(first_move)
        move = first_move  
      else
        #if its not available, try one from next_best array.  
        #Checks board to see if spot is taken
        move = next_best.find{|m| !board.taken?(m)}
      end
      
      #Take move and converts to string
      #If none set, choose random number if above doesn't check out.
      if move
        move.to_s
      else
        rand(1..9).to_s
      end   
    end
    

  end
end



