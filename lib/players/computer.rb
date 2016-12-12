class Player::Computer < Player

  attr_accessor :board

  def move(board)
    board.valid_move?(rand(1..9).to_s) ? rand(1..9).to_s : move(board)
  end

end
