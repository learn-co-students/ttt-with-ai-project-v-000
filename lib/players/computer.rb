module Players
    class Computer < Player
        def move(board)
            input = 1 + rand(9)
            input.to_s
        end
    end
end