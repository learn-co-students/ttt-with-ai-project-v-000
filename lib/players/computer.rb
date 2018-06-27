class Players::Computer < Player


  def move(board)
    if !board.taken?(5)
      "5"
      elsif board.cells[1] == " "
      "1"
      elsif board.cells[3] == " "
      "3"
      elsif board.cells[7] == " "
      "7"
      elsif board.cells[9] == " "
      "9"
      elsif board.cells[2] == " "
      "2"
      elsif board.cells[4] == " "
      "4"
      elsif board.cells[6] == " "
      "6"
      elsif board.cells[8] == " "
      "8"
    end
  end
end
