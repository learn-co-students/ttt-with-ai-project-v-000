module Players

  class Computer < Player
    def move(board)
      # Need to figure out how to have the computer keep playing until the game ends.
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
      else
        board.detect { |cell| cell == " "}
      end
    end
  end

end
