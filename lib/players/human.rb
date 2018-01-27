module Players    
    class Human < Player
        
        def move(input = nil)
            puts "Where would you like to move(1-9)?"
            input = gets
        end
        
    end
end