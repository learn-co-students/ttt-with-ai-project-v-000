require 'pry'
module Players
  class Computer < Player
      def move(board)
        case board.turn_count
          when 0
            #take the middle first
            "5"
          when 1
            #if the middle is free, take it
            if board.cells[4] == " "
              "5"
            #else take a corner
            else
              free_spaces = board.cells.each_index.select{|i| board.cells[i] == " "} #grab the index of all free spaces
              free_spaces.delete_if{|x| x == 1 || x == 3 || x == 5 || x == 7} #remove everything that's not a corner
              (free_spaces.sample + 1).to_s #move at a random corner
            end
          when 2
            (board.cells.index{|p| p == " "} + 1).to_s
          when 3
            (board.cells.index{|p| p == " "} + 1).to_s
          when 4
            (board.cells.index{|p| p == " "} + 1).to_s
          when 5
            (board.cells.index{|p| p == " "} + 1).to_s
          when 6
            (board.cells.index{|p| p == " "} + 1).to_s
          when 7
            (board.cells.index{|p| p == " "} + 1).to_s
          when 8
            (board.cells.index{|p| p == " "} + 1).to_s
          when 9
            (board.cells.index{|p| p == " "} + 1).to_s
        end
      end
  end
end
