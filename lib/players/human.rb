require 'pry'
module Players
  class Human < Player
    # your code here
    def move(board)
      input = gets.strip
      return input
    end

  end
end
