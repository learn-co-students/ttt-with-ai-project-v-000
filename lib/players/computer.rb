require "pry"
module Players
  attr_accessor :board, :game, :player
  class Computer < Player
    
    def move(board)
      puts board.display
      puts "no spot" if board.full?
        
      end
      if board.turn_count == 1 
        board.update(@board.cells[4], "X")
      else
        return "no spot"
      end
  
    end
    
  
  
  
  
  end
end