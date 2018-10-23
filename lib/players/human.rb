require 'pry'
require_relative '../player.rb'

module Players
  class Human < Player
  
    def move(input)
      puts "Please enter 1-9:"
      input = gets.strip
    end
  
  end
end