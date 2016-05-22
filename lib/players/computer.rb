class Player::Computer < Player
  def move(board)
    random = 1 + rand(9)
    random = random.to_s
    if board.valid_move?(random) == true
      random
    else
      move(board)
    end
  end

end