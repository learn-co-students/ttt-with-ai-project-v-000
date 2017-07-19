module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(7)
        move = "7"

      elsif board.turn_count == 1
        move = "5"

      end

      # elsif board.turn_count == 2
      #   move = [1, 7].detect{|i| !board.taken?(i)}.to_s

      if board.position(1) == board.position(2)
        move = "3"

      elsif board.position(1) == board.position(3)
        move = "2"

      elsif board.position(2) == board.position(3)
        move = "1"

      end

      if board.position(4) == board.position(5)
        move = "6"

      elsif board.position(4) == board.position(6)
        move = "5"

      elsif board.position(5) == board.position(6)
        move = "4"

      end

      if board.position(7) == board.position(8)
        move = "9"

      elsif board.position(7) == board.position(9)
        move = "8"

      elsif board.position(8) == board.position(9)
        move = "7"

      end

      if board.position(1) == board.position(5)
        move = "9"

      elsif board.position(9) == board.position(5)
        move = "1"

      elsif board.position(1) == board.position(9)
        move = "5"

      end

      if board.position(3) == board.position(5)
        move = "7"

      elsif board.position(3) == board.position(7)
        move = "5"

      elsif board.position(7) == board.position(5)
        move = "3"

      end

      if board.position(7) == board.position(4)
        move = "1"

      elsif board.position(7) == board.position(1)
        move = "4"

      elsif board.position(1) == board.position(4)
        move = "7"

      end

      if board.position(2) == board.position(8)
        move = "5"

      elsif board.position(2) == board.position(5)
        move = "8"

      elsif board.position(5) == board.position(8)
        move = "2"

      end

      if board.position(3) == board.position(6)
        move = "9"

      elsif board.position(6) == board.position(9)
        move = "3"

      elsif board.position(3) == board.position(9)
        move = "6"

      end

    end

  end

end
