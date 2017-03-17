require_relative '../player.rb'
require 'pry'

module Players
  class Computer < Player
    def move(board)
      choice = (rand*9).ceil
      puts "The computer (#{self.token}) has moved in spot #{choice}"
      "#{(rand*9).ceil}"
    end
  end
end
