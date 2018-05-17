require 'pry'

module Players
  class Human < Player

    def move(board)
      puts "please select a position 1-9:"
      index = gets.strip
      index
    end
  end
end
