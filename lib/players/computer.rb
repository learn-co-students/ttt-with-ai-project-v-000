class Computer < Player

  attr_accessor :opp_token, :valid_moves

  def move(board)
    self.valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    if self.token == "X"
      self.opp_token = "O"
    else
      self.opp_token = "X"
    end
    if board.cells[4] == !(taken?)
      self.valid_move[5]
    elsif corners(board) == !(taken?)
      
    else
       self.valid_move.sample
    end
  end

  #def comp_move(board)
  #  corners(board) || win_computer(board) || block(board) || random
  #end

  def corners(board)
    (board.cells[0] || board.cells[2] || board.cells[6] || board.cells[8]).sample
  end


end