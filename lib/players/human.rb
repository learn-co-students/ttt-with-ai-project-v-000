module Players
    class Human < Player
        def move(board)
            input = ""
            while !board.valid_move?(input)
                puts "Make your move by entering 1-9"
                input = gets.strip
            end
            board.update(input, self)
            input
        end
    end
end