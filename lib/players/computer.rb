class Players::Computer < Player

  def move(board)
    return (board.cells.index(" ") + 1).to_s
  end
end
