class Computer < Player

  def move(board)
    # return (board.cells.index(" ") + 1).to_s
    return rand(1..9)
  end

  def own_win
  end

  def opponent_win
  end

  def fork
  end

  def center
  end

  def opposite_corner
  end

  def empty_side
  end

end
