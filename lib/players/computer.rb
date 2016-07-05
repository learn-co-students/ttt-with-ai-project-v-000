class Player::Computer < Player

  def valid_move?(board, location)
    location.to_i.between?(1,9) && !position_taken?(board, location.to_i - 1)
  end

end
