class Player::Computer < Player
  def move(board)
    "#{computer_move}"
  end

  def computer_move
    rand(1..9)
  end
end
