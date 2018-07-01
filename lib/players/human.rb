require 'pry'

module Players
    class Human < Player
        def move(board)
            puts "Enter your move: (1-9):"
            player_move = gets.strip
            return player_move
        end
    end
end