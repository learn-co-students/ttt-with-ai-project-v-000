

class Players

    class Human < Player

        def move(board)
            puts "Pick a spot"
            input = gets
            if input.match(/^(\d)+$/)
            input
        else
            puts "invalid"
            input = gets
            input
        end
        end
    end

end
