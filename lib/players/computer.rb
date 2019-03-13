require 'pry'
module Players
  class Computer < Player
   
    def move(board)
      if token == "X"
        #computer stops top row victory 
        if board.cells[0] == "O" && board.cells[1] == "O" && board.cells[2] == " "
          return "3"
        elsif board.cells[1] == "O" && board.cells[2] == "O" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "O" && board.cells[2] == "O" && board.cells[1] == " "
          return "2"
        #computer stops middle row victory
        elsif board.cells[3] == "O" && board.cells[4] == "O" && board.cells[5] == " "
          return "6"
        elsif board.cells[4] == "O" && board.cells[5] == "O" && board.cells[3] == " "
          return "4"
        elsif board.cells[3] == "O" && board.cells[5] == "O" && board.cells[4] == " "
          return "5"
        #computer stops bottom row victory 
        elsif board.cells[6] == "O" && board.cells[7] == "O" && board.cells[8] == " "
          return "9"
        elsif board.cells[7] == "O" && board.cells[8] == "O" && board.cells[6] == " "
          return "7"
        elsif board.cells[6] == "O" && board.cells[8] == "O" && board.cells[7] == " "
          return "8"
        #computer stops left column victory
        elsif board.cells[0] == "O" && board.cells[3] == "O" && board.cells[6] == " "
          return "7"
        elsif board.cells[3] == "O" && board.cells[6] == "O" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "O" && board.cells[6] == "O" && board.cells[3] == " "
          return "4"
        #computer stops middle column victory
        elsif board.cells[1] == "O" && board.cells[4] == "O" && board.cells[7] == " "
          return "8"
        elsif board.cells[4] == "O" && board.cells[7] == "O" && board.cells[1] == " "
          return "2"
        elsif board.cells[1] == "O" && board.cells[7] == "O" && board.cells[4] == " "
          return "5"
        #computer stops right column victory
        elsif board.cells[2] == "O" && board.cells[5] == "O" && board.cells[8] == " "
          return "9"
        elsif board.cells[5] == "O" && board.cells[8] == "O" && board.cells[2] == " "
          return "3"
        elsif board.cells[2] == "O" && board.cells[8] == "O" && board.cells[5] == " "
          return "6"
        #computer stops top left to bottom right diagonal victory
        elsif board.cells[0] == "O" && board.cells[4] == "O" && board.cells[8] == " "
          return "9"
        elsif board.cells[4] == "O" && board.cells[8] == "O" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "O" && board.cells[8] == "O" && board.cells[4] == " "
          return "5"
        #computer stops top right to bottom left diagonal victory 
        elsif board.cells[6] == "O" && board.cells[4] == "O" && board.cells[2] == " "
          return "3"
        elsif board.cells[4] == "O" && board.cells[2] == "O" && board.cells[6] == " "
          return "7"
        elsif board.cells[6] == "O" && board.cells[2] == "O" && board.cells[4] == " "
          return "5"
        else
          if board.cells[4] == " "
            return "5"
          elsif board.cells[0] == " "
            return "1"
          elsif board.cells[2] == " "
            return "3"
          elsif board.cells[6] == " "
            return "7"
          elsif board.cells[8] == " "
            return "9"
          elsif board.cells[1] == " "
            return "2"
          elsif board.cells[3] == " "
            return "4"
          elsif board.cells[5] == " "
            return "6"
          elsif board.cells[7] == " "
            return "8"
          end
        end
      end 
      if token == "O"
        #computer stops top row victory 
        if board.cells[0] == "X" && board.cells[1] == "X" && board.cells[2] == " "
          return "3"
        elsif board.cells[1] == "X" && board.cells[2] == "X" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "X" && board.cells[2] == "X" && board.cells[1] == " "
          return "2"
        #computer stops middle row victory 
        elsif board.cells[3] == "X" && board.cells[4] == "X" && board.cells[5] == " "
          return "6"
        elsif board.cells[4] == "X" && board.cells[5] == "X" && board.cells[3] == " "
          return "4"
        elsif board.cells[3] == "X" && board.cells[5] == "X" && board.cells[4] == " "
          return "5"
        #computer stops bottom row victory 
        elsif board.cells[6] == "X" && board.cells[7] == "X" && board.cells[8] == " "
          return "9"
        elsif board.cells[7] == "X" && board.cells[8] == "X" && board.cells[6] == " "
          return "7"
        elsif board.cells[6] == "X" && board.cells[8] == "X" && board.cells[7] == " "
          return "8"
        #computer stops left column victory
        elsif board.cells[0] == "X" && board.cells[3] == "X" && board.cells[6] == " "
          return "7"
        elsif board.cells[3] == "X" && board.cells[6] == "X" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "X" && board.cells[6] == "X" && board.cells[3] == " "
          return "4"
        #computer stops middle column victory
        elsif board.cells[1] == "X" && board.cells[4] == "X" && board.cells[7] == " "
          return "8"
        elsif board.cells[4] == "X" && board.cells[7] == "X" && board.cells[1] == " "
          return "2"
        elsif board.cells[1] == "X" && board.cells[7] == "X" && board.cells[4] == " "
          return "5"
        #computer stops right column victory
        elsif board.cells[2] == "X" && board.cells[5] == "X" && board.cells[8] == " "
          return "9"
        elsif board.cells[5] == "X" && board.cells[8] == "X" && board.cells[2] == " "
          return "3"
        elsif board.cells[2] == "X" && board.cells[8] == "X" && board.cells[5] == " "
          return "6"
        #computer stops top left to bottom right diagonal victory
        elsif board.cells[0] == "X" && board.cells[4] == "X" && board.cells[8] == " "
          return "9"
        elsif board.cells[4] == "X" && board.cells[8] == "X" && board.cells[0] == " "
          return "1"
        elsif board.cells[0] == "X" && board.cells[8] == "X" && board.cells[4] == " "
          return "5"
        #computer stops top right to bottom left diagonal victory 
        elsif board.cells[6] == "X" && board.cells[4] == "X" && board.cells[2] == " "
          return "3"
        elsif board.cells[4] == "X" && board.cells[2] == "X" && board.cells[6] == " "
          return "7"
        elsif board.cells[6] == "X" && board.cells[2] == "X" && board.cells[4] == " "
          return "5"
        else
          if board.cells[4] == " "
            return "5"
          elsif board.cells[0] == " "
            return "1"
          elsif board.cells[2] == " "
            return "3"
          elsif board.cells[6] == " "
            return "7"
          elsif board.cells[8] == " "
            return "9"
          elsif board.cells[1] == " "
            return "2"
          elsif board.cells[3] == " "
            return "4"
          elsif board.cells[5] == " "
            return "6"
          elsif board.cells[7] == " "
            return "8"
          end
        end
      end
    end
    
  end 
end
 
