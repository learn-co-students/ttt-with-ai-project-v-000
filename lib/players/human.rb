module Players
    class Human < Player
        def move(board)
            board.display
            puts "Choose an open position on the board"
            input = gets.strip
        end
    end
end