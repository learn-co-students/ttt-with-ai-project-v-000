require "pry"
module Players
    class Human < Player
        def move(board)
            # binding.pry
            puts "Please enter a number between 1 - 9:"
            input = gets.strip
        end
    end
end
