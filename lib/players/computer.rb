require 'pry'
module Players
  class Computer < Player
   
    def move(board)
      if token == "X"
        #computer stops top row victory 
        if board.cells[0] == "O" && board.cells[1] == "O" && board.cells[2] == " "
          "3"
        elsif board.cells[1] == "O" && board.cells[2] == "O" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "O" && board.cells[2] == "O" && board.cells[1] == " "
          "2"
        #computer stops middle row victory
        elsif board.cells[3] == "O" && board.cells[4] == "O" && board.cells[5] == " "
          "6"
        elsif board.cells[4] == "O" && board.cells[5] == "O" && board.cells[3] == " "
          "4"
        elsif board.cells[3] == "O" && board.cells[5] == "O" && board.cells[4] == " "
          "5"
        #computer stops bottom row victory 
        elsif board.cells[6] == "O" && board.cells[7] == "O" && board.cells[8] == " "
          "9"
        elsif board.cells[7] == "O" && board.cells[8] == "O" && board.cells[6] == " "
          "7"
        elsif board.cells[6] == "O" && board.cells[8] == "O" && board.cells[7] == " "
          "8"
        #computer stops left column victory
        elsif board.cells[0] == "O" && board.cells[3] == "O" && board.cells[6] == " "
          "7"
        elsif board.cells[3] == "O" && board.cells[6] == "O" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "O" && board.cells[6] == "O" && board.cells[3] == " "
          "4"
        #computer stops middle column victory
        elsif board.cells[1] == "O" && board.cells[4] == "O" && board.cells[7] == " "
          "8"
        elsif board.cells[4] == "O" && board.cells[7] == "O" && board.cells[1] == " "
          "2"
        elsif board.cells[1] == "O" && board.cells[7] == "O" && board.cells[4] == " "
          "5"
        #computer stops right column victory
        elsif board.cells[2] == "O" && board.cells[5] == "O" && board.cells[8] == " "
          "9"
        elsif board.cells[5] == "O" && board.cells[8] == "O" && board.cells[2] == " "
          "3"
        elsif board.cells[2] == "O" && board.cells[8] == "O" && board.cells[5] == " "
          "6"
        #computer stops top left to bottom right diagonal victory
        elsif board.cells[0] == "O" && board.cells[4] == "O" && board.cells[8] == " "
          "9"
        elsif board.cells[4] == "O" && board.cells[8] == "O" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "O" && board.cells[8] == "O" && board.cells[4] == " "
          "5"
        #computer stops top right to bottom left diagonal victory 
        elsif board.cells[6] == "O" && board.cells[4] == "O" && board.cells[2] == " "
          "3"
        elsif board.cells[4] == "O" && board.cells[2] == "O" && board.cells[6] == " "
          "7"
        elsif board.cells[6] == "O" && board.cells[2] == "O" && board.cells[4] == " "
          "5"
        else
          "#{rand(1..9)}"
        end
      end 
      if token == "O"
        #computer stops top row victory 
        if board.cells[0] == "X" && board.cells[1] == "X" && board.cells[2] == " "
          "3"
        elsif board.cells[1] == "X" && board.cells[2] == "X" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "X" && board.cells[2] == "X" && board.cells[1] == " "
          "2"
        #computer stops middle row victory 
        elsif board.cells[3] == "X" && board.cells[4] == "X" && board.cells[5] == " "
          "6"
        elsif board.cells[4] == "X" && board.cells[5] == "X" && board.cells[3] == " "
          "4"
        elsif board.cells[3] == "X" && board.cells[5] == "X" && board.cells[4] == " "
          "5"
        #computer stops bottom row victory 
        elsif board.cells[6] == "X" && board.cells[7] == "X" && board.cells[8] == " "
          "9"
        elsif board.cells[7] == "X" && board.cells[8] == "X" && board.cells[6] == " "
          "7"
        elsif board.cells[6] == "X" && board.cells[8] == "X" && board.cells[7] == " "
          "8"
        #computer stops left column victory
        elsif board.cells[0] == "X" && board.cells[3] == "X" && board.cells[6] == " "
          "7"
        elsif board.cells[3] == "X" && board.cells[6] == "X" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "X" && board.cells[6] == "X" && board.cells[3] == " "
          "4"
        #computer stops middle column victory
        elsif board.cells[1] == "X" && board.cells[4] == "X" && board.cells[7] == " "
          "8"
        elsif board.cells[4] == "X" && board.cells[7] == "X" && board.cells[1] == " "
          "2"
        elsif board.cells[1] == "X" && board.cells[7] == "X" && board.cells[4] == " "
          "5"
        #computer stops right column victory
        elsif board.cells[2] == "X" && board.cells[5] == "X" && board.cells[8] == " "
          "9"
        elsif board.cells[5] == "X" && board.cells[8] == "X" && board.cells[2] == " "
          "3"
        elsif board.cells[2] == "X" && board.cells[8] == "X" && board.cells[5] == " "
          "6"
        #computer stops top left to bottom right diagonal victory
        elsif board.cells[0] == "X" && board.cells[4] == "X" && board.cells[8] == " "
          "9"
        elsif board.cells[4] == "X" && board.cells[8] == "X" && board.cells[0] == " "
          "1"
        elsif board.cells[0] == "X" && board.cells[8] == "X" && board.cells[4] == " "
          "5"
        #computer stops top right to bottom left diagonal victory 
        elsif board.cells[6] == "X" && board.cells[4] == "X" && board.cells[2] == " "
          "3"
        elsif board.cells[4] == "X" && board.cells[2] == "X" && board.cells[6] == " "
          "7"
        elsif board.cells[6] == "X" && board.cells[2] == "X" && board.cells[4] == " "
          "5"
        else
          "#{rand(1..9)}"
        end
      end
    end
    
  end 
end
 
 
        
    
  

=begin   
  def move(board)
    binding.pry 
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end
    end

#starting to try a strategy method to see if two cells in a 
  end 
end
 
=begin 
module Players
  class Computer < Player 
    def move(board)
      puts "Where would you like to move?"
      position = "#{rand(1..9)}"
    end
  end 
end
=end 

