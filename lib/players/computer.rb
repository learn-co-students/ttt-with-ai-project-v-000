class Player::Computer < Player

  def move(board)
    if !@board.taken?("5")
      "5".to_i
    else
    end
  end
end