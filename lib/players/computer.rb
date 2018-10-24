module Players
    class Computer < Player
        # VALID_MOVE?
     # returns 'true' for user input between 1-9 as long as cell isn't already #taken?
        def valid_move?(input)
            input.to_i.between?(1,9) && !taken?(input)
        end
        # MOVE
        #selects a random number between 1 - 9, not 0 - 8.
        def move(position)
            position = rand(1..9).to_s
            
        end
    end
end
