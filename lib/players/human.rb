require_relative '../player.rb'

class Players 
  
  class Human < Player
    
    def move(board)
      input = gets
      # board.update(input, self)
    end
    
  end
end