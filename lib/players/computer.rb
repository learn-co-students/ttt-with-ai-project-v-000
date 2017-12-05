module Players
    class Computer < Player
        
        attr_accessor :player_1, :player_2, :board

        def move(board)
            [1, 2, 3, 4, 5, 6, 7, 8, 9].find {|i| !board.taken?(i)}.to_s
        end 
    end
end 

pseudocode:


