module Players
    class Human < Player

        def move(board)
            puts "Enter a number 1-9"
            input = gets.chomp
            input
        end

    end
end