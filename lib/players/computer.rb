require 'pry'

module Players

  class Computer < Player
    attr_accessor :input

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      @input = valid_moves.sample
      #this is where I will program in the AI
    end

  end
end
