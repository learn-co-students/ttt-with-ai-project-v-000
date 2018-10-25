require 'pry'

module Players

    class Computer < Player

        corners = [1, 3, 7, 9]

        # --MOVE--
        #selects a random number between 1 - 9, not 0 - 8.
        def move(position)
            position = rand(1..9).to_s 
        end

         # --VALID_MOVE?--
         def valid_move?(input)
            input.to_i.between?(1,9) && !taken?(input)
        end
    end
end
