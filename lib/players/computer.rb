class Player::Computer < Player

  def move(board)
    if !board.taken?(1)
      "1"
    end
    more_moves(board)
  end

  def more_moves(board)
    moves_array = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
    moves_array.detect{ |space| !board.taken?(space) }
  end

end
