module Players
    class Computer < Player
        
        attr_accessor:moves, :taken_spots
        
        ALMOST_WINS = [
            ]
        
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
            possible_moves = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
            case
            when turn_count == 0
                possible_moves[0]
            when turn_count == 1
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 2
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 3
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 4
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 5
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 6
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 7
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 8
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            when turn_count == 9
                possible_moves.find do |move|
                    !board.taken?(move)
                end
            end
        end
    end
end