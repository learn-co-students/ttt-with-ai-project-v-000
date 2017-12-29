module Players
    class Human < Player

        attr_accessor :player_1, :player_2, :board

        def move(board)
         gets.strip
        end
    end
end