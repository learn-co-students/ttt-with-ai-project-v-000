module Players
  class Computer < Player

  def move(board)
    if board.cells[4] == " "
      "5"
    elsif board.cells[6] == " "
      "7"
    elsif board.cells[7] == " "
      "8"
    elsif board.cells[0] == " "
      "1"
    elsif board.cells[2] == " "
      "3"
  end
end
  end
end
