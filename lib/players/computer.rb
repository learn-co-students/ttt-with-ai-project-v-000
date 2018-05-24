module Players
  class Computer < Player
    attr_accessor :board


    def move(board)
      if board.cells[4] == " "
        timer
         "5"
      elsif board.cells[0] == " "
         timer
         "1"
      elsif board.cells[2] == " "
         timer
         "3"
      elsif board.cells[6] == " "
         timer
         "7"
      elsif board.cells[8] == " "
         timer
         "9"
      elsif board.cells[1] == " "
         timer
         "2"
      elsif board.cells[3] == " "
         timer
         "4"
      elsif board.cells[5] == " "
         timer
         "6"
      elsif board.cells[7] == " "
         timer
         "8"
      end
    end

    def timer
      sleep(6)
    end

  end
end

#Adjust the computer move method to include valid computer move.
#Adjust the turn method to accommodate the computer's turn without requesting input from the user.
#Find a way to randomize the computer moves
#Write the win, block, tie, corner and center moves for the computer
