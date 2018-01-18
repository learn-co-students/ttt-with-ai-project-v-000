module Players
    class Computer < Player

        def move(board)
            index = board.cells.index(' ')+1
            index.to_s
        end

    end
end
