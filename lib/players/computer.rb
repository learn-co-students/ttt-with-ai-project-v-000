module Players
  class Computer < Player
    attr_reader :board, :cells

    def move(board)
      if board.cells[0] == " " && board.cells[4] == " "
        "1"
      else board.cells[4] == "0"
        "5"
      end
    end

  end
end
