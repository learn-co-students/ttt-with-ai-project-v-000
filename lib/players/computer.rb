module Players
  class Computer < Player
      attr_accessor :board, :cells

      def move(board)
         if board.cells[0] == " " && board.cells[4] == " "
           "1"
         elsif board.cells[4] == " "
           "5"
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

  end

end