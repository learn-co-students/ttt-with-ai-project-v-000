require_relative "../board.rb"
require 'pry'

module Players
    class Human < Player

        def move(board)
            puts "#{self.token}, where would you like to move (1-9)?"
            input = gets.strip
            input
        end

    end
end


  #binding.pry