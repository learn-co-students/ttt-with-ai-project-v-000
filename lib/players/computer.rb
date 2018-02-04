require 'pry'
module Players
  
  class Computer < Player
    
    #@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    def move(board)
      @board = board
      move = @board.cells.find_index {|x| x == " "} + 1 
      move.to_s 
    end 
  end
  
end 