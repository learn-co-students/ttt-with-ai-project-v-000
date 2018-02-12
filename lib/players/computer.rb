module Players
    
    class Computer < Player
        
        def move(board)

            move = nil
      
                if !board.taken?(5)
                move = "5"
                
                elsif board.turn_count == 1
                move = "1"
                
                elsif board.turn_count == 1 && (board.taken?(1) || board.taken?(9))
                move = [3, 7].detect{|i| !board.taken?(i)}.to_s
            
                elsif board.turn_count == 2 (board.taken?(3) || board.taken?(7))
                move = [1, 9].detect{|i| !board.taken?(i)}.to_s
                
                elsif board.turn_count == 2 (board.taken?(2) || board.taken?(8))
                move = [4, 6].detect{|i| !board.taken(i}).to_s
                
                elsif board.turn_count == 3 (board.taken?(4) || board.taken?(6))
                move = [2, 8].detect{|i| !board.taken(i}).to_s
                
                elsif board.turn_count == 3 && winner(board)
                    winner(board).find do |spaces|
                        board.cells[spaces + 1].to_s == " "
                    end
                
                else
                    board.cells.find_index do |cell|
                        a = cell == " "
                        a + 1.to_s
                    end
                    
            end
        end 
        
        def winner(board)
             Game::WIN_COMBINATIONS.detect do |gametime|
                        (board.cells[gametime[0]] == enemy_token && board.cells[gametime[1]] == enemy_token && board.cells[gametime[2]] == " ") ||
                        (board.cells[gametime[0]] == enemy_token && board.cells[gametime[2]] == enemy_token && board.cells[gametime[1]] == " ") ||
                        (board.cells[gametime[1]] == enemy_token && board.cells[gametime[2]] == enemy_token && board.cells[gametime[0]] == " ")
                    end
                end
        end
        
       
        
    end
end

#for reference

#WIN_COMBINATIONS = [
        #[0, 1, 2], 
        #[3, 4, 5], 
        #[6, 7, 8], 
        #[0, 3, 6], 
        #[1, 4, 7], 
        #[2, 5, 8], 
        #[0, 4, 8], 
        #[2, 4, 6], 
   #]

