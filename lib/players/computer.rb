require "pry"

module Players


   class Computer < Player

     def move(board)
       if board.cells[4] == " "
         return  "5"
       end
       if board.cells.select {|cell| cell == "X" || cell == "O"}.size == 1
         return "1"
       end
       if board.cells.select {|cell| cell == "X" || cell == "O"}.size == 2  && board.cells[1] == " "
         return "2"
       end
       if board.cells.select {|cell| cell == " "}.size == 6
         return "8"
       end
       if board.cells.select {|cell| cell == " "}.size == 5
         return "4"
       end

       if board.cells.select {|cell| cell == " "}.size == 4
         return "6"
       end
       if board.cells.select {|cell| cell == " "}.size == 3
         return "9"
       end
       if board.cells.select {|cell| cell == " "}.size == 2
         return "3"
       end
       if board.cells.select {|cell| cell == " "}.size == 1
         return "7"
       end

     end

   end
end
