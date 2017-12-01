module Players
    class Human < Player

        attr_accessor :player_1, :player_2

        def move(input)
         input = gets
        end
    end
end