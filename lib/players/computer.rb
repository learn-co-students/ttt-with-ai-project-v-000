module Players
    class Computer < Player
        
        attr_accessor:moves, :taken_spots
        
        def initialize(token)
            super
            @moves = []
        end
        
        def add_move(input)
            @moves << input
            input
        end
        
        def taken_spots(board)
            spots = []
            board.cells.each_with_index do |cell, index| 
                if cell != " " 
                    spots << index + 1
                end
            end
        end
            
        
        def move(board)
            turn_count = board.turn_count
            case
            when turn_count == 0
                add_move("7")
            when turn_count != 0
                add_move("3")
            end
        end
    end
end