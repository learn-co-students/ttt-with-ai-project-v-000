require 'pry'

module Players

  class Human < Player
    attr_accessor :input

    def move(game)
      @input = gets.strip
    end

  end
end
