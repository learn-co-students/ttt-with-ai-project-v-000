module Players
    class Computer < Player
        COMPUTER_NAMES = [
            "HAL 9000",
            "WOPR",
            "SKYNET",
            "YOUR UNCLE'S DELL INSPIRON",
            "DEEP MIND"
        ]

        attr_accessor :name
        
        def move(board)
            spot = 0
            while (board.taken?("#{spot+1}"))
                spot += 1
            end
            "#{spot+1}"
        end
    end
end