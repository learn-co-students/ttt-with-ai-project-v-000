module Players
  class Computer < Player

    def move(board)
      if  board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[0,8] == ["X", "X"]
        "5"
      elsif board.cells[0,2] == ["X", "X"]
        "2"
      elsif board.cells[0,6] == ["X", "X"]
        "4"
      elsif board.cells[6,8] == ["X", "X"]
        "8"
      elsif board.cells[8,2] == ["X", "X"]
        "6"
      end
    end
#
  end
end
