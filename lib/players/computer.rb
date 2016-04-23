class Player::Computer < Player

  def move(board)
    if !board.taken?('5')
      '5'
    else
      best_move(board) + 1
    end
  end

end
