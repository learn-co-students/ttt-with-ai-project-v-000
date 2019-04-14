module Players
    class Human<Player

        def move(board) #won't be using the parameter for humans, but will want it passed
            puts "Make a move: 1-9"
            gets
        end
    end
end
