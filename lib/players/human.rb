require 'pry'
module Players
  class Human < Player

    def move(board)
      
      puts "Please enter a number 1-9"
      gets.strip

    end
  end
end
