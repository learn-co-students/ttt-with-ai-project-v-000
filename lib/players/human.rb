require 'pry'

module Players

  class Human < Player

    def move(board)
      puts "Please make your move"
      input = gets.strip
    end
  end
end
