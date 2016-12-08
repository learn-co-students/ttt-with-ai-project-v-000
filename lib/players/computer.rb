require 'pry'
module Players
  class Computer < Player

    #def initialize(token)
    #  @token = token
    #end

   def move(board)
    array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
     input = array.to_i.sample
      board.update(input, player)
   end

 end
end
