module Players
    class Computer < Player
    
        def move(board)
            valid = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            valid.sample
        end
    end
end