require_relative '../player.rb'
require 'pry'

module Players
  class Computer < Player

    def move(board)
      "#{(rand*9).ceil}"
    end
  end
end
