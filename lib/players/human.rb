require 'pry'

module Players

  class Human < Player

    def move(input)
      puts "What is your input?"
      input = gets.strip
      input
    end

  end

end
