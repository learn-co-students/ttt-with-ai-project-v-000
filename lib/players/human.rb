require 'pry'

module Players
  class Human < Player
    def move(board)
      puts "Please enter a number (1-9): "
      input = gets.strip
      return input
    end

  end
end
