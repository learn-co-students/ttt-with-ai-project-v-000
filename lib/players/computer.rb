require 'pry'

module Players
  class Computer < Player

    def move(board)
      if board.valid_move?("4")
        "4"
      elsif board.valid_move?("0")
        "0"
      elsif board.valid_move?("2")
        "2"
      elsif board.valid_move?("6")
        "6"
      elsif board.valid_move?("8")
        "8"
      elsif board.cells[0] == "X" && board.cells[1] == "X"
        "2"
      elsif board.cells[1] == "X" && board.cells[2] == "X"
        "0"
      elsif board.cells[3] == "X" && board.cells[4] == "X"
        "5"
      elsif board.cells[4] == "X" && board.cells[5] == "X"
        "3"
      elsif board.cells[6] == "X" && board.cells[7] == "X"
        "8"
      elsif board.cells[7] == "X" && board.cells[8] == "X"
        "6"
      elsif board.cells[0] == "X" && board.cells[3] == "X"
        "6"
      elsif board.cells[3] == "X" && board.cells[6] == "X"
        "0"
      elsif board.cells[1] == "X" && board.cells[4] == "X"
        "7"
      elsif board.cells[4] == "X" && board.cells[7] == "X"
        "1"
      elsif board.cells[2] == "X" && board.cells[5] == "X"
        "8"
      elsif board.cells[0] == "X" && board.cells[4] == "X"
        "8"
      elsif board.cells[8] == "X" && board.cells[4] == "X"
        "0"
      elsif board.cells[2] == "X" && board.cells[4] == "X"
        "6"
      elsif board.cells[6] == "X" && board.cells[4] == "X"
        "2"

      end
    end
  end
end
