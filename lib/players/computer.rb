class Player::Computer < Player

  def move(board)
    if !board.taken?(5)
      "5"
    else
      !position_taken?(board, location.to_i - 1)

      location.to_i.between?(1,9)
    end
  end

end
