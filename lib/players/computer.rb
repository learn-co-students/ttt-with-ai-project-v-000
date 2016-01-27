class Player::Computer < Player
  def move(board)
    # makes a valid move
    rand(1..9).to_s
  end
end
