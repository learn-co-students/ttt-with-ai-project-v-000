require_relative '../player.rb'
require_relative '../game.rb'
require 'spec_helper'


module Players

  class Human < Player

    def initialize(token)
      @token = token
    end

    def move(board)
      input = gets
      input
    end

  end

  class Computer < Player

    def initialize(token)
      @token = token
    end

    def move(board)
      input = gets
      input
    end
  end

end
