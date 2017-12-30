module Players
    class Human < Player
        attr_accessor :name

        def move(game_or_board)
            board = nil
            if (game_or_board.is_a?(Game))
                board = game_or_board.board
            else
                board = game_or_board
            end

            puts ""
            board.display
            puts ""
            puts "You are playing the #{self.token} pieces, #{self.name}."
            print "Enter a valid move (1-9): "
            gets.chomp
        end
    end
end