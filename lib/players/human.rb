module Players
    class Human < Player

        def move(board)
            puts "Place token: "
            gets.chomp
        end
    end
end