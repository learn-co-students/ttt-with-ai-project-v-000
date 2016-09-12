module Players
    class Computer < Player
        
        attr_accessor:moves, :other_players_moves
        
        WINNING_COMBINATIONS_HASH = {
            "1" => [
                ["2", "3"],
                ["4", "7"],
                ["5", "9"]
                ],
            "2" => [
                ["1", "3"],
                ["5", "8"]
                ],
            "3" => [
                ["1", "2"],
                ["6", "9"],
                ["5", "7"]
                ],
            "4" => [
                ["5", "6"],
                ["1", "7"],
                ],
            "5" => [
                ["6", "4"],
                ["2", "8"],
                ["1", "9"],
                ["3", "7"]
                ],
            "6" => [
                ["4", "5"],
                ["3", "9"]
                ],
            "7" => [
                ["8", "9"],
                ["1", "4"],
                ["3", "5"]
                ],
            "8" => [
                ["7", "9"],
                ["2", "5"]
                ],
            "9" => [
                ["7", "8"],
                ["3", "6"],
                ["1", "5"]
                ]
        }
        
        def initialize(token)
            super
            @moves = []
            @other_players_moves = []
        end
        
        def add_move(input)
            @moves << input
            input
        end
        
        def other_players_moves(board)
            board.each do |cell|
                if cell != self.token && cell != " "
                    @other_players_moves << cell
                end
            end
            @other_players_moves
        end
        
        def self_winning?
            WINNING_COMBINATIONS_AI.find do |array|
                
            
        
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