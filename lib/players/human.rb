require 'pry'
module Players
  class Human < Player
    def move(board=nil)
      puts "Please enter a board position to play: "
      input = gets.strip
    end
  end
end