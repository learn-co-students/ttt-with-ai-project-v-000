module Players
    class Human < Player
        def move(board)
            board.display
            puts "Enter your move (1-9): "
            move_input = gets.chomp
            while (move_input.to_i < 1 || move_input.to_i > 9)
                puts "Please enter a valid move in the 1-9 range: "
                move_input = gets.chomp
            end
            move_input
        end
    end
end