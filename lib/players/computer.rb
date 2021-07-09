require 'pry'

module Players

    class Computer < Player
        # BEST MOVE (center square)
        # computer == [4], human position == "5" 

        # SECOND_BEST_MOVES (corner squares)
        # computer == [0, 2, 6, 8], humman == "1", "3", "7" , "9"
          #---VALID_MOVE?-------
        def valid_move?(input)
            input.to_i.between?(1,9) && !taken?(board)
        end

        
        def move(board)
            squares = [[5],[1, 3, 7, 9], [2, 4, 6, 8]]

            #center square
            best_move = "#{squares[0][0]}" #using interpolation here is 
            #the same as converting to_s
            # corners
            second_best_moves = "#{squares[1].sample}" 
            least_favorable_moves = "#{squares[2].sample}"
       
            if !board.taken?(best_move)
                best_move
            elsif !board.taken?(second_best_moves)
                second_best_moves
            else 
                "#{rand(1..9)}" #same as converting to_s
            end
        end
    end
end

