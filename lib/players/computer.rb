module Players
  class Computer < Player
    attr_reader :board, :cells

    def move(board)
      until over? do
        if board.cells[0] == " " && board.cells[4] == " "
          "1"
        elsif board.cells[4] == " "
          "5"
        elsif board.cells[2] == " " && !won?
          "3"
        elsif board.cells[6] == " "
          "7"
        elsif board.cells[8] == " "
          "9"
        end
      end
    end

  end
end
