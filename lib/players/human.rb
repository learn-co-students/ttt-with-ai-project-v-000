require 'pry'

module Players

  class Human < Player
    attr_accessor :input

    def move(board)
      @input = gets.strip
    end

  end
end
