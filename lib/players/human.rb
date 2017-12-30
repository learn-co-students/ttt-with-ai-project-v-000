module Players
    class Human < Player
        attr_accessor :name

        def move(game)
            puts ""
            if (Game == game.class)
                game.board.display
            end
            puts ""
            puts "You are playing the #{self.token} pieces, #{self.name}."
            print "Enter a valid move (1-9): "
            gets.chomp
        end
    end
end