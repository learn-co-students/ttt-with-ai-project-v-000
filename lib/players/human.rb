require "pry"

module Players
  class Human < Player
    def move board
      puts "Make a move"
      input = gets.chomp
    end
  end
end

