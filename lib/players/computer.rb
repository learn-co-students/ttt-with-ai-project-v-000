require 'pry'

module Players
  class Computer < Player

    #returns a valid move, 1-9 string
    #token is available 
    def move(board) #passing in the object of board, all cells empty 
      return rand(1..9).to_s
    end

  end
end