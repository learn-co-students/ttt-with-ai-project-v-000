class Players
  class Computer < Player
    attr_accessor :board

    def move(board)
      computer_moves(board)
    end


    def computer_moves(board)
      if board.cells[4] == " "
        "5"
      else 
        corners(board) || other_moves(board)
      end
    end
    
    def corners(board)
      if board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      end
    end
    
    def other_moves(board)
      if board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      elsif board.cells[9] == " "
        "8"
      end
    end
  end
end
   
  
 
    
    
    
    
    
    