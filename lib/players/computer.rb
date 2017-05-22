module Players
    class Computer < Player
        def move(board)
            # -> passes tests return "1"
            (board.available_indexes().sample + 1).to_s
        end
    end
end