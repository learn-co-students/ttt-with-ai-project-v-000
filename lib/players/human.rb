module Players
    
    class Human < Player
        
        def move(board)
            puts "Please make a valid move"
            gets.chomp
        end
    
    end
end

