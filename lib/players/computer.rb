require 'pry'

module Players
    class Computer < Player
        # take the first available position
        def move(board)
            i = 0
            player_move = ""

            while i < board.cells.length
                player_move = board.index_to_input(i)
                if !board.taken?(player_move)
                    return player_move
                else
                    i += 1
                end
            end
        end
    end
end