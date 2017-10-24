module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        "5"
      else
        if !board.taken?("5")
          "5"
        elsif !board.taken?("1")
          "1"
        elsif !board.taken?("3")
          "3"
        elsif !board.taken?("7")
          "7"
        elsif !board.taken?("9")
          "9"
        elsif !board.taken?("2")
          "2"
        elsif !board.taken?("4")
          "4"
        elsif !board.taken?("6")
          "6"
        else !board.taken?("8")
          "8"
        end
      end
    end

  end
end
