

require 'pry'
module Players
    class Human < Player

        
        def move(board)
            
            puts "Please choose a space: 1-9"
           
            board.display
            input = gets.strip
            
        end

    end
end
