module Players
    class Human < Player
        def move(board)
            puts "Select a position 1-9"
            input = gets.chomp
            input
        end
    end
end