module Players
    class Computer < Player
        def move(board)
            if !board.taken?(5) #if comp went first: first move
                move = "5"     
            elsif board.turn_count == 1 #if comp went second: first move: take middle, if not taken, if taken, take corner, 
                move = "1"
            elsif board.turn_count <= 5
                #take any remaining corners not taken
                move = [1,3,7,9].detect {|i|!board.taken?(i)}.to_string
            else
                move = [2,3,6,8].detect {|i|!board.taken?(i)}.to_string
            # else take non-corners       
            end

        end
    end
end