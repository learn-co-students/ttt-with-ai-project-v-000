require "pry"

module Players
  class Human < Player
    def move board
      puts "Player #{self.token}'s turn:"
      board.display
      puts "Select a position 1-9"
      input = gets.strip
    end
  end
end

