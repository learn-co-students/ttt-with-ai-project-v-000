module Players
  class Computer < Player

def move(board)
  case
      when board.cells[1] == " "
        "2"
      when board.cells[2] == " "
        "3"
      when board.cells[3] == " "
        "4"
      when board.cells[5] == " "
        "6"
      when board.cells[7] == " "
        "8"
      when board.cells[8] == " "
        "9"
      else
        nil
      end
    end
  end
end
