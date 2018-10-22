module Players
    class Computer < Player
        
        # #move
        #selects a random number between 1 - 9, not 0 - 8.
        def move(position)
            position = rand(1..9).to_s
            until valid_move?(input)

            end
            
        end
    end   
end
