require 'pry'

module Players
  class Human < Player

    def move(board)
      puts "Please enter your move (1-9)"
      #binding.pry
      input = gets.strip
      input
    end

  end
end
