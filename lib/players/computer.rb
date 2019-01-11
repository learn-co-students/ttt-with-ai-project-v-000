module Players
  class Computer < Player
  
    
    def move(board)
      
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = rand(1..9)
      
    end 
  end
end 
