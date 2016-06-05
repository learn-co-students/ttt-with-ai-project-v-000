class Player::Computer < Player

  def move(board)
    if !board.taken?(5)
      "5"
    else
      good_move(board) + 1
    end
  end

  def good_move(board)
    corner(board) || random
  end

  def corner(board)
    [0,2,6,8].detect {|cell| !board.taken?(cell+1)}
  end

  def random
    (0..8).to_a.sample
  end

end
