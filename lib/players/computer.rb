require 'pry'
class Players
  class Computer <  Player 
    def move(board)
      # binding.pry
      input = rand(8).to_s 
      @input = input

    end
    
  end
end


