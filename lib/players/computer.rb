require 'pry'

module Players

  class Computer < Player
    attr_accessor :input

    def move(game)
      # binding.pry
      #self = #<Players::Computer:0x000000011e16c0 @token="O">


      @input = game.computer_ai


    end
  end
end
