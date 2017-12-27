module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      elsif !board.taken?("3")
        "3"
      elsif !board.taken?("7")
        "7"
      elsif !board.taken?("9")
        "9"
      elsif !board.taken?("1")
        "1"
      end
    end
  end
end


# input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#  if board.valid_move? = "1"
#if player2 inputs any number between 1-9, it is a valid move if the cell is not taken
#  end
