module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      else
        "1"
      end
    end
  end
end