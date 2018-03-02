require 'pry'
module Players
  class Human < Player
    def move(board)
      puts "Please enter a board position to play: "
      input = gets.chomp
    end
  end
end