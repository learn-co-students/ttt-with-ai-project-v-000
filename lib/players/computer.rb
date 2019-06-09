module Players
  
  class Computer < Player
  
    def move(board)
      #puts "Please enter 1-9:"

      if (board.valid_move?("5"))
        input = "5"
      else
        if (board.valid_move?("1"))
          input = "1"
        end
      end   
    end
  end
    
end