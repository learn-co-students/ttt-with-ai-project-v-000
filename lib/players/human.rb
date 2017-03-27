module Players
    class Human < Player

        def move(board)
            user_input = gets.chomp
            puts user_input
            user_input
        end

    end
end
