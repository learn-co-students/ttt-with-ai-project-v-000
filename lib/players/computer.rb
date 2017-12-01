module Players
    class Computer < Player
        
        attr_accessor :player_1, :player_2

        def move(input)
            input = gets
        end 
    end
end 