require_relative '../player.rb'
require_relative '../game.rb'

module Players

  class Human < Player

    def initialize(token)
      @token = []
      @token << token
    end

    def move(board)
      input = gets
      input
    end

  end

end
