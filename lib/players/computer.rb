module Players
    
    class Computer < Player
        
        def move(board)

            move = nil
      
                if !board.taken?(5)
                move = "5"
                
                elsif board.turn_count == 1
                move = "1"
                
                elsif board.turn_count == 2
                move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
            
                elsif board.turn_count == 3
                move = [2, 6, 4, 8].detect{|i| !board.taken?(i)}.to_s
            end
        end 
        
        def ai_wins
            move until move == WIN_COMBINATIONS
        end 
        
        
    end
end

 WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], #Top
        [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical - array 1
        [0, 4, 8], [2, 4, 6], #diagonal - array 2
    ]

