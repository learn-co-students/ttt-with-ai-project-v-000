module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(7)
        move = "7"

      elsif board.turn_count == 1
        move = "5"

      elsif board.turn_count == 2
        move = [1, 7].detect{|i| !board.taken?(i)}.to_s

      elsif board.turn_count == 3
        move = [4, 8].detect{|i| !board.taken?(i)}.to_s

      elsif board.position(1) == "X" && board.position(2) == " " && board.position(3) == " "
        move = "3"

      elsif board.position(4) == "X" && board.position(5) == "X" && board.position(6) == " "
        move = "6"

      elsif board.position(7) == "X" && board.position(8) == "X" && board.position(9) == " "
        move = "9"

      end

    end

  end

end
