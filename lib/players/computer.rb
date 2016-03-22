class Computer < Player

  attr_accessor :opp_token, :valid_moves

  def move(board)
    self.valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    if self.token == "X"
      self.opp_token = "O"
    else
      self.opp_token = "X"
    end
    self.valid_moves.sample
  end


end