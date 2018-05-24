module Players
  class Computer < Player

    attr_accessor :board
    #played perfectly is unwinnable. logic - like on turn 1 always pic middle or go to corner. min/max algorithm may not work.
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
      sleep(2)
    end


  end
end
