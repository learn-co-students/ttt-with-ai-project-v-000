module Players
    class Computer < Player
        
        attr_accessor:moves
        
        def add_move(input)
            @moves << input
            input
        end
        
        def move(board)
            turn_count = board.turn_count
            case
            when turn_count == 0
                @moves = []
                add_move("7")
            when turn_count != 0 
                add_move("3")
            end
        end
    end
end