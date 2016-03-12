class Computer < Player
  attr_accessor :opp_token, :valid_moves

  def move(board)
    self.valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    if self.token == "X"
      self.opp_token = "O"
    else
      self.opp_token = "X"
    end
    if self.offensive(board)
      self.offensive(board)
    elsif self.defensive(board)
      self.defensive(board)
    else
      self.valid_moves.sample
    end
  end

  def offensive(board)
    if board.cells[0] == self.token && board.cells[1] == self.token && board.cells[2] != self.opp_token #row 1 - h
      self.valid_moves[2]
    elsif board.cells[0] == self.token && board.cells[2] == self.token && board.cells[1] != self.opp_token # row 1 - h
      self.valid_moves[1]
    elsif board.cells[1] == self.token && board.cells[2] == self.token && board.cells[0] != self.opp_token # row 1 - h
      self.valid_moves[0]
    elsif board.cells[3] == self.token && board.cells[4] == self.token && board.cells[5] != self.opp_token # row 2 - h
      self.valid_moves[5]
    elsif board.cells[3] == self.token && board.cells[5] == self.token && board.cells[4] != self.opp_token # row 2 - h
      self.valid_moves[4]
    elsif board.cells[4] == self.token && board.cells[5] == self.token && board.cells[3] != self.opp_token # row 2 - h
      self.valid_moves[3]
    elsif board.cells[6] == self.token && board.cells[7] == self.token && board.cells[8] != self.opp_token # row 3 - h
      self.valid_moves[8]
    elsif board.cells[6] == self.token && board.cells[8] == self.token && board.cells[7] != self.opp_token # row 3 - h
      self.valid_moves[7]
    elsif board.cells[7] == self.token && board.cells[8] == self.token && board.cells[6] != self.opp_token # row 3 - h
      self.valid_moves[6]
    elsif board.cells[0] == self.token && board.cells[3] == self.token && board.cells[6] != self.opp_token # row 1 - v
      self.valid_moves[6]
    elsif board.cells[0] == self.token && board.cells[6] == self.token && board.cells[3] != self.opp_token # row 1 - v
      self.valid_moves[3]
    elsif board.cells[3] == self.token && board.cells[6] == self.token && board.cells[0] != self.opp_token # row 1 - v
      self.valid_moves[0]
    elsif board.cells[1] == self.token && board.cells[4] == self.token && board.cells[7] != self.opp_token # row 2 - v
      self.valid_moves[7]
    elsif board.cells[1] == self.token && board.cells[7] == self.token && board.cells[4] != self.opp_token # row 2 - v
      self.valid_moves[4]
    elsif board.cells[4] == self.token && board.cells[7] == self.token && board.cells[1] != self.opp_token # row 2 - v
      self.valid_moves[1]
    elsif board.cells[2] == self.token && board.cells[5] == self.token && board.cells[8] != self.opp_token # row 3 - v
      self.valid_moves[8]
    elsif board.cells[2] == self.token && board.cells[8] == self.token && board.cells[5] != self.opp_token # row 3 - v
      self.valid_moves[5]
    elsif board.cells[5] == self.token && board.cells[8] == self.token && board.cells[2] != self.opp_token # row 3 - v
      self.valid_moves[2]
    elsif board.cells[0] == self.token && board.cells[4] == self.token && board.cells[8] != self.opp_token # topleft - bottomright - d
      self.valid_moves[8]
    elsif board.cells[0] == self.token && board.cells[8] == self.token && board.cells[4] != self.opp_token # topleft - bottomright - d
      self.valid_moves[4]
    elsif board.cells[4] == self.token && board.cells[8] == self.token && board.cells[0] != self.opp_token # topleft - bottomright - d
      self.valid_moves[0]
    elsif board.cells[6] == self.token && board.cells[4] == self.token && board.cells[2] != self.opp_token # bottomleft - topright - d
      self.valid_moves[2]
    elsif board.cells[2] == self.token && board.cells[4] == self.token && board.cells[6] != self.opp_token # bottomleft - topright - d
      self.valid_moves[6]
    elsif board.cells[2] == self.token && board.cells[6] == self.token && board.cells[4] != self.opp_token # bottomleft - topright - d
      self.valid_moves[4]
    end
  end

  def defensive(board)
    if board.cells[0] == self.opp_token && board.cells[1] == self.opp_token && board.cells[2] != self.token
      self.valid_moves[2]
    elsif board.cells[0] == self.opp_token && board.cells[6] == self.opp_token && board.cells[3] != self.token
      self.valid_moves[3]
    elsif board.cells[0] == self.opp_token && board.cells[2] == self.opp_token && board.cells[1] != self.token
      self.valid_moves[1]
    elsif board.cells[1] == self.opp_token && board.cells[2] == self.opp_token && board.cells[0] != self.token
      self.valid_moves[0]
    elsif board.cells[0] == self.opp_token && board.cells[3] == self.opp_token && board.cells[6] != self.token
      self.valid_moves[6]
    elsif board.cells[3] == self.opp_token && board.cells[6] == self.opp_token && board.cells[0] != self.token
      self.valid_moves[0]
    elsif board.cells[3] == self.opp_token && board.cells[4] == self.opp_token && board.cells[5] != self.token
      self.valid_moves[5]
    elsif board.cells[3] == self.opp_token && board.cells[5] == self.opp_token && board.cells[4] != self.token
      self.valid_moves[4]
    elsif board.cells[4] == self.opp_token && board.cells[5] == self.opp_token && board.cells[3] != self.token
      self.valid_moves[3]
    elsif board.cells[6] == self.opp_token && board.cells[7] == self.opp_token && board.cells[8] != self.token
      self.valid_moves[8]
    elsif board.cells[6] == self.opp_token && board.cells[8] == self.opp_token && board.cells[7] != self.token
      self.valid_moves[7]
    elsif board.cells[7] == self.opp_token && board.cells[8] == self.opp_token && board.cells[6] != self.token
      self.valid_moves[6]
    elsif board.cells[1] == self.opp_token && board.cells[4] == self.opp_token && board.cells[7] != self.token
      self.valid_moves[7]
    elsif board.cells[1] == self.opp_token && board.cells[7] == self.opp_token && board.cells[4] != self.token
      self.valid_moves[4]
    elsif board.cells[4] == self.opp_token && board.cells[7] == self.opp_token && board.cells[1] != self.token
      self.valid_moves[1]
    elsif board.cells[2] == self.opp_token && board.cells[5] == self.opp_token && board.cells[8] != self.token
      self.valid_moves[8]
    elsif board.cells[2] == self.opp_token && board.cells[8] == self.opp_token && board.cells[5] != self.token
      self.valid_moves[5]
    elsif board.cells[5] == self.opp_token && board.cells[8] == self.opp_token && board.cells[2] != self.token
      self.valid_moves[2]
    elsif board.cells[0] == self.opp_token && board.cells[4] == self.opp_token && board.cells[8] != self.token
      self.valid_moves[8]
    elsif board.cells[0] == self.opp_token && board.cells[8] == self.opp_token && board.cells[4] != self.token
      self.valid_moves[4]
    elsif board.cells[4] == self.opp_token && board.cells[8] == self.opp_token && board.cells[0] != self.token
      self.valid_moves[0]
    elsif board.cells[2] == self.opp_token && board.cells[4] == self.opp_token && board.cells[6] != self.token
      self.valid_moves[6]
    elsif board.cells[2] == self.opp_token && board.cells[6] == self.opp_token && board.cells[4] != self.token
      self.valid_moves[4]
    elsif board.cells[4] == self.opp_token && board.cells[6] == self.opp_token && board.cells[2] != self.token
      self.valid_moves[2]
    end
  end

end