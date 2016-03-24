class Player::Computer < Player
  def move(board)
    next_move = 1
    while board.taken?(next_move)
      next_move += 1
    end
    "#{next_move}"
  end
end
