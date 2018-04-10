module Players
  class Computer < Player

    def move(board)
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = ["1", "3", "7", "9"].detect{|position| !board.taken?(position)}
    
      else
        if board.turn_count % 2 == 0 && board.cells[0] == "O" && board.cells[4] == "O" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 == 0 && board.cells[4] == "O" && board.cells[8] == "O" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 == 0 && board.cells[2] == "O" && board.cells[4] == "O" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 == 0 && board.cells[4] == "O" && board.cells[6] == "O" && !board.taken?(3)
          move = "3"

        elsif board.turn_count % 2 == 0 && board.cells[0] == "O" && board.cells[1] == "O" && !board.taken?(3)
          move = "3"
        elsif board.turn_count % 2 == 0 && board.cells[1] == "O" && board.cells[2] == "O" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 == 0 && board.cells[0] == "O" && board.cells[2] == "O" && !board.taken?(2)
          move = "2"

        elsif board.turn_count % 2 == 0 && board.cells[0] == "O" && board.cells[3] == "O" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 == 0 && board.cells[3] == "O" && board.cells[6] == "O" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 == 0 && board.cells[0] == "O" && board.cells[6] == "O" && !board.taken?(4)
          move = "4"

        elsif board.turn_count % 2 == 0 && board.cells[3] == "O" && board.cells[4] == "O" && !board.taken?(6)
          move = "6"
        elsif board.turn_count % 2 == 0 && board.cells[4] == "O" && board.cells[5] == "O" && !board.taken?(4)
          move = "4"
        elsif board.turn_count % 2 == 0 && board.cells[3] == "O" && board.cells[5] == "O" && !board.taken?(5)
          move = "5"

        elsif board.turn_count % 2 == 0 && board.cells[6] == "O" && board.cells[7] == "O" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 == 0 && board.cells[7] == "O" && board.cells[8] == "O" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 == 0 && board.cells[6] == "O" && board.cells[8] == "O" && !board.taken?(8)
          move = "8"

        elsif board.turn_count % 2 == 0 && board.cells[1] == "O" && board.cells[4] == "O" && !board.taken?(8)
          move = "8"
        elsif board.turn_count % 2 == 0 && board.cells[4] == "O" && board.cells[7] == "O" && !board.taken?(2)
          move = "2"
        elsif board.turn_count % 2 == 0 && board.cells[1] == "O" && board.cells[7] == "O" && !board.taken?(5)
          move = "5"

        elsif board.turn_count % 2 == 0 && board.cells[2] == "O" && board.cells[5] == "O" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 == 0 && board.cells[5] == "O" && board.cells[8] == "O" && !board.taken?(3)
          move = "3"
        elsif board.turn_count % 2 == 0 && board.cells[2] == "O" && board.cells[8] == "O" && !board.taken?(6)
          move = "6"

        elsif board.turn_count % 2 != 0 && board.cells[0] == "X" && board.cells[4] == "X" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 != 0 && board.cells[4] == "X" && board.cells[8] == "X" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 != 0 && board.cells[2] == "X" && board.cells[4] == "X" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 != 0 && board.cells[4] == "X" && board.cells[6] == "X" && !board.taken?(3)
          move = "3"

        elsif board.turn_count % 2 != 0 && board.cells[0] == "X" && board.cells[1] == "X" && !board.taken?(3)
          move = "3"
        elsif board.turn_count % 2 != 0 && board.cells[1] == "X" && board.cells[2] == "X" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 != 0 && board.cells[0] == "X" && board.cells[2] == "X" && !board.taken?(2)
          move = "2"

        elsif board.turn_count % 2 != 0 && board.cells[0] == "X" && board.cells[3] == "X" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 != 0 && board.cells[3] == "X" && board.cells[6] == "X" && !board.taken?(1)
          move = "1"
        elsif board.turn_count % 2 != 0 && board.cells[0] == "X" && board.cells[6] == "X" && !board.taken?(4)
          move = "4"

        elsif board.turn_count % 2 != 0 && board.cells[3] == "X" && board.cells[4] == "X" && !board.taken?(6)
          move = "6"
        elsif board.turn_count % 2 != 0 && board.cells[4] == "X" && board.cells[5] == "X" && !board.taken?(4)
          move = "4"
        elsif board.turn_count % 2 != 0 && board.cells[3] == "X" && board.cells[5] == "X" && !board.taken?(5)
          move = "5"

        elsif board.turn_count % 2 != 0 && board.cells[6] == "X" && board.cells[7] == "X" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 != 0 && board.cells[7] == "X" && board.cells[8] == "X" && !board.taken?(7)
          move = "7"
        elsif board.turn_count % 2 != 0 && board.cells[6] == "X" && board.cells[8] == "X" && !board.taken?(8)
          move = "8"

        elsif board.turn_count % 2 != 0 && board.cells[1] == "X" && board.cells[4] == "X" && !board.taken?(8)
          move = "8"
        elsif board.turn_count % 2 != 0 && board.cells[4] == "X" && board.cells[7] == "X" && !board.taken?(2)
          move = "2"
        elsif board.turn_count % 2 != 0 && board.cells[1] == "X" && board.cells[7] == "X" && !board.taken?(5)
          move = "5"

        elsif board.turn_count % 2 != 0 && board.cells[2] == "X" && board.cells[5] == "X" && !board.taken?(9)
          move = "9"
        elsif board.turn_count % 2 != 0 && board.cells[5] == "X" && board.cells[8] == "X" && !board.taken?(3)
          move = "3"
        elsif board.turn_count % 2 != 0 && board.cells[2] == "X" && board.cells[8] == "X" && !board.taken?(6)
          move = "6"

        else
          if !board.taken?(2)
            move = "2"
          elsif !board.taken?(4)
            move = "4"
          elsif !board.taken?(6)
            move = "6"
          elsif !board.taken?(8)
            move = "8"
          elsif !board.taken?(5)
            move = "5"
          elsif !board.taken?(1)
            move = "1"
          elsif !board.taken?(3)
            move = "3"
          elsif !board.taken?(7)
            move = "7"
          elsif !board.taken?(9)
            move = "9"

          end
        end
      end
      end

  end
end
