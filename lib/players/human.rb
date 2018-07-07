
module Players
  
  class Human < Player
  
    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
      # if board.valid_move?(input) 
      #   board.current_player == "X" ? "1" : "2"
      # else
      #   "invalid"
      # end
    end   
  end
    
end