module Players
  class Computer < Player

    def move(board)
      if self.token == "X"
        if board.turn_count == 0
          "1"
        elsif board.turn_count == 2
          if board.taken?(5)
            "9"
          elsif board.taken?(3)
            "7"
          elsif board.taken?(7)
            "3"
          elsif !board.taken?(7)
            "7"
          elsif !board.taken?(3)
            "3"
          end
        elsif board.turn_count == 4
          if board.taken?(3) && !board.taken?(7)
            "7"
          elsif board.taken?(7) && !board.taken?(3)
            "3"
          elsif !board.taken?(9)
            "9"
          end
        elsif board.position(3) == "X" && !board.taken?(2)
          "2"
        elsif board.position(7) == "X" && !board.taken?(4)
          "4"
        elsif board.position(9) == "X" && board.position(3) == "X" && !board.taken?(6)
          "6"
        elsif board.position(9) == "X" && board.position(7) == "X" && !board.taken?(8)
          "8"
        elsif !board.taken?(2)
          "2"
        elsif !board.taken?(4)
          "4"
        elsif !board.taken?(6)
          "6"
        elsif !board.taken?(8)
          "8"
        else board.cells.each_with_index do |cell, index|
            if !board.taken?(index)
              return index
            end
          end
        end
      else  #token O
        if board.turn_count == 1
          if board.taken?(5)
            "1"
          else
            "5"
          end
        elsif board.turn_count == 3
          if board.taken?(3) && !board.taken?(7)
            "7"
          elsif board.taken?(7) && !board.taken?(3)
            "3"
          elsif !board.taken?(9)
            "9"
          elsif !board.taken?(3)
            "3"
          elsif !board.taken?(7)
            "7"
          end
        elsif board.taken?(3) && !board.taken?(2)
          "2"
        elsif board.taken?(7) && !board.taken?(4)
          "4"
        elsif board.taken?(9) && !board.taken?(6)
          "6"
        elsif board.taken?(9) && !board.taken?(8)
          "8"
        else
          board.cells.each_with_index do |cell, index|
            if !board.taken?(index)
              return index
            end
          end

        end

      end #end of token O
    end #move
  end
end
