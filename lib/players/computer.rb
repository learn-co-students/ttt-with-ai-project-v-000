class Player::Computer < Player
  def minmax(game)

    
  end

  def move(board = nil, position = nil)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    position = valid_moves.sample
  end
end