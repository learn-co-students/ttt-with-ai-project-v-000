class Player::Computer < Player

  def move(board)
    if !board.taken?("5") 
      "5" 
    elsif try_corners(board)
      try_corners(board)
    else
      rand(1..9)
    end
  end

  def try_corners(board)
    ["1", "3", "7", "9"].detect {|cell| !board.taken?(cell)}
  end
end
