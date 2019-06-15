module Players
  class Computer < Player

  def move(board)
    #firstmove-corner or center
      if board.valid_move?("1")
        "1"
      elsif board.valid_move?("5")
        "5"
      elsif board.cells[0] == board.cells[1] && board.valid_move?("3")
        "3"
      elsif board.cells[0] == board.cells[2] && board.valid_move?("2")
        "2"
      elsif board.cells[3] == board.cells[4] && board.valid_move?("6")
        "6"
      elsif board.cells[4] == board.cells[5] && board.valid_move?("4")
        "4"
      elsif board.cells[6] == board.cells[7] && board.valid_move?("9")
        "9"
      elsif board.cells[6] == board.cells[8] && board.valid_move?("8")
        "8"
      elsif board.cells[7] == board.cells[8] && board.valid_move?("7")
        "7"
      elsif board.cells[0] == board.cells[3] && board.valid_move?("7")
        "7"
      elsif board.cells[0] == board.cells[6] && board.valid_move?("4")
        "4"
      elsif board.cells[1] == board.cells[4] && board.valid_move?("8")
        "8"
      elsif board.cells[4] == board.cells[7] && board.valid_move?("2")
        "2"
      elsif board.cells[2] == board.cells[5] && board.valid_move?("9")
        "9"
      elsif board.cells[2] == board.cells[8] && board.valid_move?("6")
        "6"
      elsif board.cells[5] == board.cells[8] && board.valid_move?("3")
        "3"
      elsif board.cells[0] == board.cells[4] && board.valid_move?("9")
        "9"
      elsif board.cells[2] == board.cells[4] && board.valid_move?("7")
        "7"
      elsif board.cells[4] == board.cells[6] && board.valid_move?("3")
        "3"
      else
        rand(1..9).to_s
      end
   end

  end
end
