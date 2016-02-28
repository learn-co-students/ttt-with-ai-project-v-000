class Player::Computer < Player

  #TO DO: Not be lazy and actually make an AI
  def move(board)
    position = random(board)
    

  end

  def random(board)
    position = rand(1..9).to_s
    board.valid_move?(position) ? position : random(board)
  end
end