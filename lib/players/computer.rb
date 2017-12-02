require 'pry'
class Players::Computer < Player

  def move(board)
    if board.cells[0] == board.cells[1] && board.valid_move?("3") && (board.cells[0] != " ")
      "3"
    elsif board.cells[0] == board.cells[2] && board.valid_move?("2") && (board.cells[0] != " ")
      "2"
    elsif board.cells[1] == board.cells[2] && board.valid_move?("1") && (board.cells[1] != " ")
      "1"
    elsif board.cells[3] == board.cells[4] && board.valid_move?("6") && (board.cells[3] != " ")
      "6"
    elsif board.cells[3] == board.cells[5] && board.valid_move?("5") && (board.cells[3] != " ")
      "5"
    elsif board.cells[4] == board.cells[5] && board.valid_move?("4") && (board.cells[4] != " ")
      "4"
    elsif board.cells[6] == board.cells[7] && board.valid_move?("9") && (board.cells[6] != " ")
      "9"
    elsif board.cells[6] == board.cells[8] && board.valid_move?("8") && (board.cells[6] != " ")
      "8"
    elsif board.cells[7] == board.cells[8] && board.valid_move?("7") && (board.cells[7] != " ")
      "7"
    elsif board.cells[0] == board.cells[3] && board.valid_move?("7") && (board.cells[0] != " ")
        "7"
    elsif board.cells[0] == board.cells[6] && board.valid_move?("4") && (board.cells[0] != " ")
      "4"
    elsif board.cells[3] == board.cells[6] && board.valid_move?("1") && (board.cells[3] != " ")
      "1"
    elsif board.cells[1] == board.cells[4] && board.valid_move?("8") && (board.cells[1] != " ")
      "8"
    elsif board.cells[1] == board.cells[7] && board.valid_move?("5") && (board.cells[1] != " ")
      "5"
    elsif board.cells[4] == board.cells[7] && board.valid_move?("2") && (board.cells[4] != " ")
      "2"
    elsif board.cells[2] == board.cells[5] && board.valid_move?("9") && (board.cells[2] != " ")
      "9"
    elsif board.cells[2] == board.cells[8] && board.valid_move?("6") && (board.cells[2] != " ")
      "6"
    elsif board.cells[5] == board.cells[8] && board.valid_move?("3") && (board.cells[5] != " ")
      "3"
    elsif board.cells[0] == board.cells[4] && board.valid_move?("9") && (board.cells[0] != " ")
      "9"
    elsif board.cells[0] == board.cells[8] && board.valid_move?("5") && (board.cells[0] != " ")
      "5"
    elsif board.cells[4] == board.cells[8] && board.valid_move?("1") && (board.cells[4] != " ")
      "2"
    elsif board.cells[2] == board.cells[4] && board.valid_move?("7") && (board.cells[2] != " ")
      "7"
    elsif board.cells[2] == board.cells[6] && board.valid_move?("5") && (board.cells[2] != " ")
      "5"
    elsif board.cells[4] == board.cells[6] && board.valid_move?("3") && (board.cells[4] != " ")
      "3"
    elsif board.cells[0] != " " && board.cells[8] == " " && (board.cells[2] == " " || board.cells[6] == " ")
      "9"
    elsif board.cells[8] != " " && board.cells[0] == " " && (board.cells[2] == " " || board.cells[6] == " ")
      "1"
    elsif board.cells[2] != " " && board.cells[6] == " " && (board.cells[0] == " " || board.cells[8] == " ")
      "7"
    elsif board.cells[6] != " " && board.cells[2] == " " && (board.cells[0] == " " || board.cells[8] == " ")
      "3"
    elsif board.valid_move?("5")
      "5"
    elsif board.valid_move?("1")
      "1"
    elsif board.valid_move?("3")
      "3"
    elsif board.valid_move?("9")
      "9"
    elsif board.valid_move?("7")
      "7"
    elsif board.valid_move?("2")
      "2"
    elsif board.valid_move?("6")
      "6"
    elsif board.valid_move?("8")
      "8"
    elsif board.valid_move?("4")
      "4"
    end
  end


end
