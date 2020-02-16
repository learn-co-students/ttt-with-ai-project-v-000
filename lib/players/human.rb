module Players 
    class Human < Player

        def move(array)
            puts "Make a move."
            value = gets.chomp
            value
        end
    end
end