class Player
  attr_reader :token, :comp_board

  def initialize(token)
    @token = token
  end

  @comp_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def update_board(new_board)
    @comp_board = new_board
  end

end
