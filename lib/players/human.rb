module Players
    class Human < Player
        def move(board)
            board.display
            puts "Enter a valid move (1-9): "
            gets.chomp
        end
    end
end