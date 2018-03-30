require 'pry'

module Players

  class Computer < Player
    attr_accessor :input

    def move(board)
      @input = rand(1..9).to_s
    end
  end


end
