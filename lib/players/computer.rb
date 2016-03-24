class Computer < Player

  attr_accessor :opp_token, :valid_moves

  def move(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    if self.token == "X"
      self.opp_token = "O"
    else
      self.opp_token = "X"
    end
    if board.cells[4] == " "
      valid_moves[4]
    elsif corners(board) == (valid_moves[0] || valid_moves[2] || valid_moves[6] || valid_moves[8])
      corners(board)
    else
       valid_moves.sample
    end
  end

 
  def corners(board)
    valid = ["0", "2", "6", "8"]
    cornermove = valid.sample
      cornermove
  end


end


 #def comp_move(board)
  #  corners(board) || win_computer(board) || block(board) || random
  #end