class Player::Computer < Player

  def move(board)
    computer_move = rand(0..9)
    computer_move.to_s
  end



end