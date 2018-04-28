require "pry"
module Players
  attr_accessor :board, :game, :player
  class Computer < Player
    
    def move(board)
      if board.turn_count == 0 
        return "4"
      elsif board.update("1", "X")
      elsif board.update("3", "X")
      elsif board.update("7", "X")
      elsif board.update("9", "X")
      elsif board.update("2", "X")
      elsif board.update("4", "X")
      elsif board.update("5", "X")
      elsif board.update("6", "X")
      
      end
    end
    
  
  
  
  
  end
end