class Player::Computer < Player

  def move(board)
    board = ["1", "2", "3", "4", "5", "6", "7","8", "9"].sample
    board
  end

end