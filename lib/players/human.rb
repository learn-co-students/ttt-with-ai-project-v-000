module Players
    class Human < Player

        def move(board)
            puts "Please enter 1-9:"
            num = gets.strip
            return num
        end

    end
end
