require 'pry'

module Players
  class Human < Player

    def move(board)
      puts "Please select your move (1-9):"
      gets.strip
    end

  end
end
