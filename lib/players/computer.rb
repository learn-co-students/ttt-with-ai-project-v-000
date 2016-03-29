class Computer < Player

  def move(board)
    rand(board.cells.length).to_s
  end

end