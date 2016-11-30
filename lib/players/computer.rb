module Players
  class Computer < Player

    def move(board)
      print "The computer's move:"

      if (board.cells[0] == "X" && board.cells[2] == "X")
        "2"
      elsif (board.cells[1] == "X" && board.cells[2] == "X")
        "1"
      elsif (board.cells[0] == "X" && board.cells[1] == "X")
        "3"
      elsif (board.cells[3] == "X" && board.cells[4] == "X")
        "6"
      elsif (board.cells[3] == "X" && board.cells[5] == "X")
        "5"
      elsif (board.cells[4] == "X" && board.cells[5] == "X")
        "4"
      elsif (board.cells[6] == "X" && board.cells[7] == "X")
        "9"
      elsif (board.cells[6] == "X" && board.cells[8] == "X")
        "8"
      elsif (board.cells[7] == "X" && board.cells[8] == "X")
        "7"
      elsif (board.cells[0] == "X" && board.cells[3] == "X")
        "7"
      elsif (board.cells[0] == "X" && board.cells[6] == "X")
        "4"
      elsif (board.cells[3] == "X" && board.cells[6] == "X")
        "1"
      elsif (board.cells[1] == "X" && board.cells[4] == "X")
        "8"
      elsif (board.cells[4] == "X" && board.cells[7] == "X")
        "2"
      elsif (board.cells[1] == "X" && board.cells[7] == "X")
        "5"
      elsif (board.cells[2] == "X" && board.cells[5] == "X")
        "9"
      elsif (board.cells[5] == "X" && board.cells[8] == "X")
        "3"
      elsif (board.cells[2] == "X" && board.cells[8] == "X")
        "6"
      elsif (board.cells[0] == "X" && board.cells[4] == "X")
        "9"
      elsif (board.cells[0] == "X" && board.cells[8] == "X")
        "5"
      elsif (board.cells[4] == "X" && board.cells[8] == "X")
        "1"
      elsif (board.cells[2] == "X" && board.cells[4] == "X")
        "7"
      elsif (board.cells[4] == "X" && board.cells[6] == "X")
        "3"
      elsif (board.cells[2] == "X" && board.cells[6] == "X")
        "5"
      elsif (board.cells[1] == nil)
        "1"
      elsif (board.cells[3] == nil)
        "3"
      elsif (board.cells[7] == nil)
        "7"
      elsif (board.cells[9] == nil)
        "9"

      end
    end

  end
end
