class Player::Computer < Player
  def move(board)
    if !board.taken?("5")
      "5"
    else
    rand(1..9).to_s
  end
  end
end
