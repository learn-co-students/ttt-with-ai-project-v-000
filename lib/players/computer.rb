require 'pry'
module Players 
  class Computer < Player
    def move(board)
      puts "Computer: Select a number 1-9."
      if board.cells.count(" ") == 9
          @@board_pos.delete(@@board_pos.sample)
      #center    
        elsif board.cells[4] == " "
          @@board_pos.delete("5") #center
        elsif board.cells[4] == "X"
          @@board_pos.delete("8") #bottom-center, counter to X in center position
      #top-center
        elsif board.cells[4] == "X" && board.cells[7] == "X" && board.cells[1] == " " ||
          board.cells[0] == "X" && board.cells[2] == "X" && board.cells[1] == " " ||
          board.cells[4] == "O" && board.cells[7] == "O" && board.cells[1] == " " ||
          board.cells[0] == "O" && board.cells[2] == "O" && board.cells[1] == " "
            @@board_pos.delete("2") #top-center
      #left-center    
        elsif board.cells[4] == "X" && board.cells[5] == "X" && board.cells[3] == " " ||
          board.cells[0] == "X" && board.cells[6] == "X" && board.cells[3] == " " ||
          board.cells[4] == "O" && board.cells[5] == "O" && board.cells[3] == " " ||
          board.cells[0] == "O" && board.cells[6] == "O" && board.cells[3] == " "
            @@board_pos.delete("4") #left-center
      #right-center
        elsif board.cells[4] == "X" && board.cells[3] == "X" && board.cells[5] == " " ||
          board.cells[2] == "X" && board.cells[5] == "X" && board.cells[5] == " " ||
          board.cells[4] == "O" && board.cells[3] == "O" && board.cells[5] == " " ||
          board.cells[2] == "O" && board.cells[5] == "O" && board.cells[5] == " "
            @@board_pos.delete("6") #right-
      #bottom-center
        elsif board.cells[4] == "X" && board.cells[1] == "X" && board.cells[7] == " " ||
          board.cells[6] == "X" && board.cells[8] == "X" && board.cells[7] == " " ||
          board.cells[4] == "O" && board.cells[1] == "O" && board.cells[7] == " " ||
          board.cells[6] == "O" && board.cells[8] == "O" && board.cells[7] == " "
            @@board_pos.delete("8") #bottom-center
      #top-left
        elsif board.cells[1] == "X" && board.cells[2] == "X" && board.cells[0] == " " ||
          board.cells[3] == "X" && board.cells[6] == "X" && board.cells[0] == " " || 
          board.cells[4] == "X" && board.cells[8] == "X" && board.cells[0] == " " ||
          board.cells[1] == "X" && board.cells[3] == "X" && board.cells[0] == " " ||        
          board.cells[1] == "O" && board.cells[2] == "O" && board.cells[0] == " " ||
          board.cells[3] == "O" && board.cells[6] == "O" && board.cells[0] == " " || 
          board.cells[4] == "O" && board.cells[8] == "O" && board.cells[0] == " " ||
          board.cells[1] == "X" && board.cells[3] == "X" && board.cells[0] == " "
            @@board_pos.delete("1") #top-left
      #top-right
        elsif board.cells[0] == "X" && board.cells[1] == "X" && board.cells[2] == " " || 
          board.cells[5] == "X" && board.cells[8] == "X" && board.cells[2] == " " || 
          board.cells[4] == "X" && board.cells[6] == "X" && board.cells[2] == " " || 
          board.cells[1] == "X" && board.cells[5] == "X" && board.cells[2] == " " ||
          board.cells[0] == "O" && board.cells[1] == "O" && board.cells[2] == " " || 
          board.cells[5] == "O" && board.cells[8] == "O" && board.cells[2] == " " || 
          board.cells[4] == "O" && board.cells[6] == "O" && board.cells[2] == " " ||
          board.cells[1] == "O" && board.cells[5] == "O" && board.cells[2] == " "
            @@board_pos.delete("3") #top-right
      #bottom-left
        elsif board.cells[7] == "X" && board.cells[8] == "X" && board.cells[6] == " " || 
          board.cells[0] == "X" && board.cells[3] == "X" && board.cells[6] == " " || 
          board.cells[2] == "X" && board.cells[4] == "X" && board.cells[6] == " " ||
          board.cells[3] == "X" && board.cells[7] == "X" && board.cells[6] == " " ||          
          board.cells[7] == "O" && board.cells[8] == "O" && board.cells[6] == " " || 
          board.cells[0] == "O" && board.cells[3] == "O" && board.cells[6] == " " || 
          board.cells[2] == "O" && board.cells[4] == "O" && board.cells[6] == " " ||
          board.cells[3] == "O" && board.cells[7] == "O" && board.cells[6] == " "
          @@board_pos.delete("7") #bottom-left
      #bottom-right
        elsif board.cells[6] == "X" && board.cells[7] == "X" && board.cells[8] == " " || 
          board.cells[2] == "X" && board.cells[5] == "X" && board.cells[8] == " " || 
          board.cells[0] == "X" && board.cells[4] == "X" && board.cells[8] == " " ||
          board.cells[5] == "X" && board.cells[7] == "X" && board.cells[8] == " " ||
          board.cells[6] == "O" && board.cells[7] == "O" && board.cells[8] == " " || 
          board.cells[2] == "O" && board.cells[5] == "O" && board.cells[8] == " " || 
          board.cells[0] == "O" && board.cells[4] == "O" && board.cells[8] == " " ||
          board.cells[5] == "O" && board.cells[7] == "O" && board.cells[8] == " "
          @@board_pos.delete("9") #bottom-right
      #random
        else
          @@board_pos.delete(@@board_pos.sample)
      end
    end
  end
end