class Player::Computer < Player

  def initialize(token)
    @token = token
  end

  def move(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    if board.cells[0] == "X" && board.cells[1] == "X" && board.cells[2] != "O"
      valid_moves[2]
    elsif board.cells[0] == "X" && board.cells[6] == "X" && board.cells[3] != "O"
      valid_moves[3]
    elsif board.cells[0] == "X" && board.cells[2] == "X" && board.cells[1] != "O"
      valid_moves[1]
    elsif board.cells[1] == "X" && board.cells[2] == "X" && board.cells[0] != "O"
      valid_moves[0]
    elsif board.cells[0] == "X" && board.cells[3] == "X" && board.cells[6] != "O"
      valid_moves[6]
    elsif board.cells[3] == "X" && board.cells[6] == "X" && board.cells[0] != "O"
      valid_moves[0]
    elsif board.cells[3] == "X" && board.cells[4] == "X" && board.cells[5] != "O"
      valid_moves[5]
    elsif board.cells[3] == "X" && board.cells[5] == "X" && board.cells[4] != "O"
      valid_moves[4]
    elsif board.cells[4] == "X" && board.cells[5] == "X" && board.cells[3] != "O"
      valid_moves[3]
    elsif board.cells[6] == "X" && board.cells[7] == "X" && board.cells[8] != "O"
      valid_moves[8]
    elsif board.cells[6] == "X" && board.cells[8] == "X" && board.cells[7] != "O"
      valid_moves[7]
    elsif board.cells[7] == "X" && board.cells[8] == "X" && board.cells[6] != "O"
      valid_moves[6]
    elsif board.cells[1] == "X" && board.cells[4] == "X" && board.cells[7] != "O"
      valid_moves[7]
    elsif board.cells[1] == "X" && board.cells[7] == "X" && board.cells[4] != "O"
      valid_moves[4]
    elsif board.cells[4] == "X" && board.cells[7] == "X" && board.cells[1] != "O"
      valid_moves[1]
    elsif board.cells[2] == "X" && board.cells[5] == "X" && board.cells[8] != "O"
      valid_moves[8]
    elsif board.cells[2] == "X" && board.cells[8] == "X" && board.cells[5] != "O"
      valid_moves[5]
    elsif board.cells[5] == "X" && board.cells[8] == "X" && board.cells[2] != "O"
      valid_moves[2]
    elsif board.cells[0] == "X" && board.cells[4] == "X" && board.cells[8] != "O"
      valid_moves[8]
    elsif board.cells[0] == "X" && board.cells[8] == "X" && board.cells[4] != "O"
      valid_moves[4]
    elsif board.cells[4] == "X" && board.cells[8] == "X" && board.cells[0] != "O"
      valid_moves[0]
    elsif board.cells[2] == "X" && board.cells[4] == "X" && board.cells[6] != "O"
      valid_moves[6]
    elsif board.cells[2] == "X" && board.cells[6] == "X" && board.cells[4] != "O"
      valid_moves[4]
    elsif board.cells[4] == "X" && board.cells[6] == "X" && board.cells[2] != "O"
      valid_moves[2]
    else
      valid_moves.sample
    end
  end

end
