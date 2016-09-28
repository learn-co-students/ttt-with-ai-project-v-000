require 'pry'
module Players
  class Computer < Player
attr_accessor :board
    
    def move(board)
      input = rand(8) + 1
      if board.valid_move?(input) == false
        input = rand(8) + 1
      else
        input

      end  
    end  
  end
end