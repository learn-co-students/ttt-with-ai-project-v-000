

require 'pry'
module Players
    class Human < Player
        def move(input)
            puts "Please choose a space"
            input = gets.strip
            
        end

    end
end
