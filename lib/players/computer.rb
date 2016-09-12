module Players
    class Computer < Player
        
        attr_accessor:moves, :other_players_moves
        
            WIN_COMBINATIONS_AI = [
        ["0", "1" ,"2"], # top row
        ["3" ,"4" ,"5"], # middle row
        ["6" ,"7" ,"8"], # bottom row
        ["0" ,"3" ,"6"], # first column
        ["1", "4", "7"], # second column
        ["2", "5", "8"], # third column
        ["0", "4", "8"], # top left to bottom right diagonal
        ["2", "4", "6"]  # top right to bottom left diagonal
            ]
        
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