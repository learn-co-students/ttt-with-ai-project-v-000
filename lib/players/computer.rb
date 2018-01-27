require 'pry'
module Players
    class Computer < Player
        def move(board)
            moves = 0
            valid_moves = []
            board.cells.collect do |x|
                moves += 1 if x == " "
                valid_moves << moves.to_s
            end
            valid_moves.sample
        end
    end
end