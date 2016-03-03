class Player::Computer < Player

  def move(board)
    [*("1".."9")].sample
  end

end