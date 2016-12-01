require 'pry'

module Players

  class Human < Player
    attr_accessor :input

    def move(input)
      @input = gets.strip
    end

  end
end
