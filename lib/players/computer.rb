require_relative '../player.rb'

class Players 
  
  class Computer < Player
    
    def move(board)
      input = gets.to_i
      # board.valid?(input)
    end
    
  end
end