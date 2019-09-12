require "pry"
module Players
  class Human < Player
    def move(array)
      input = gets.strip
      input
    end
  end
end
