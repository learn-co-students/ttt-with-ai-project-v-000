module Players
    class Computer < Player
        # take the first available position
        def move(board)
            i = 0
            player_move = ""

            while i < board.cells.length
                if !board.taken?(board.cells[i])
                    player_move = (i + 1).to_s
                    return player_move
                else
                    i += 1
                end
            end
        end
    end
end