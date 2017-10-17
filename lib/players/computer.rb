module Players
    class Computer < Player

            def move(board)
                # first move is in the middle, 
                if !board.taken?(5)
                    move = '5'
                elsif
                    !board.taken?(1)
                    move = '1'
                elsif
                    !board.taken?(3)
                    move = '3'
                elsif
                    !board.taken?(9)
                    move = '9'
                elsif
                    !board.taken?(6)
                    move = '6'
                elsif
                    !board.taken?(2)
                    move = '2'
                elsif
                    !board.taken?(4)
                    move = '4' 
                elsif
                    !board.taken?(7)
                    move = '7'
                elsif
                    !board.taken?(8)
                    move = '8'            
                end
            end
    end
end