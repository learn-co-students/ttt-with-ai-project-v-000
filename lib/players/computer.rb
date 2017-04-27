module Players
  class Computer < Player
    attr_reader :board, :cells

    def move(board)
        if board.cells[0] == " " && board.cells[4] == " "
          "1"
        elsif board.cells[4] == " "
          "5"
        elsif board.cells[2] == " " && !over?
          "3"
        elsif board.cells[6] == " " && !over?
          "7"
        elsif board.cells[8] == " " && !over?
          "9"
        elsif board.cells[1] == " " && !over?
          "2"
        elsif board.cells[3] == " " && !over?
          "4"
        elsif board.cells[5] == " " && !over?
          "6"
        elsif board.cells[7] == " " && !over?
          "8"
        end
      end

  end
end
