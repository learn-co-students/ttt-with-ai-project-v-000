require "pry"

module Players


   class Computer < Player

     def move(board)
       if board.cells[4] == " "
          "5"
       end
       if board.cells.select {|cell| cell == "X" || cell == "O"}.size == 1
         "1"
       end
       if board.cells.select {|cell| cell == "X" || cell == "O"}.size == 2  && board.cells[1] == " "
         "2"
       end
       if board.cells.select {|cell| cell == "X"}.size == 2 && board.cells[1] == "X"
         "8"
       end
       if board.cells.select {|cell| cell == " "}.size == 5
         "4"
       end
       if board.cells[3] != " " && board.cells[4] != " "
         "6"
       end
       if board.cells.select {|cell| cell == " "}.size == 3
         "9"
       end
       if board.cells.select {|cell| cell == " "}.size == 2
         "3"
       end
       if board.cells.select {|cell| cell == " "}.size == 1
         "7"
       end

     end

   end
end
