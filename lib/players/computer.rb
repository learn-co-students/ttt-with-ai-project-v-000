module Players
    class Computer < Player
        
        def move(board)
            valid = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            
            if board.turn_count == 0
                valid[0]
            elsif board.cells[7] == " "
                valid[7]
            elsif board.cells[5] == " " && !board.cells[2] == "O"
                valid[5]
            elsif board.cells[6] == " "
                valid[6]
            elsif board.cells[2] == " "
                valid[2]
            else
                valid.sample
            end
        end
        
    end
    
end