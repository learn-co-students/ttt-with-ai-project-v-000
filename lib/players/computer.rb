require 'pry'

module Players
  class Computer < Player

    def move(board)

      comp_input = nil
      if self.token == "X"
        if board.turn_count == 0
          comp_input = 1
        elsif board.turn_count == 2 && board.taken?(5)
          comp_input = 3
        elsif board.turn_count == 2 && (board.taken?(3) || board.taken?(7) || board.taken?(9))
          comp_input == [3,7,9].sample
        elsif board.turn_count == 2 && !board.taken?(5)
          comp_input == 5
        else
          #moves on out
          comp_input = board.cells.find_index {|e| e == " "} + 1
        end

      elsif self.token == "O"
        # first turn response. take middle. if middle taken take corner
        if board.turn_count == 1 && !board.taken?(5)
          comp_input = 5
        elsif board.turn_count == 1 && board.taken?(5)
          comp_input = 1

        #second turn. if "O" has middle
        elsif board.turn_count == 3 && board.cells[4] != "X"
          if board.taken?(1) && board.taken?(3)
            comp_input = 2
          elsif board.taken?(1) && board.taken?(7)
            comp_input = 4
          elsif board.taken?(7) && board.taken?(9)
            comp_input = 8
          elsif board.taken?(3) && board.taken?(9)
            comp_input = 6
          end

        elsif board.turn_count == 3 && board.cells[4] == "X"
          #second turn if X has middle
          if board.cells[1] == "X"
            comp_input = 8
          elsif board.cells[2] == "X"
            comp_input = 7
          elsif board.cells[3] == "X"
            comp_input = 6
          elsif board.cells[5] == "X"
            comp_input = 4
          elsif board.cells[6] == "X"
            comp_input = 3
          elsif board.cells[7] == "X" || board.cells[8] == "X"
            comp_input = 2
          end
        else
          #moves on out
          comp_input = board.cells.find_index {|e| e == " "} + 1
        end
      end
    end

  end
end
