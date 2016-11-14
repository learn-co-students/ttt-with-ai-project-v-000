module Players
  class Computer < Player

    def move(board)
      board.cells[0] = "1"
      board.cells[1] = "2"
      board.cells[2] = "3"
      board.cells[3] = "4"
      board.cells[4] = "5"
      board.cells[5] = "6"
      board.cells[6] = "7"
      board.cells[7] = "8"
      board.cells[8] = "9"
    end
  end
end
