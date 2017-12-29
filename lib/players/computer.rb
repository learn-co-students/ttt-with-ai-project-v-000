module Players
    class Computer < Player
        def move(board)
            spot = 0
            while (board.taken?("#{spot+1}"))
                spot += 1
            end
            "#{spot+1}"
        end
    end
end