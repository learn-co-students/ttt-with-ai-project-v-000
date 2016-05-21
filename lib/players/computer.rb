class Player::Computer < Player
  def move(board)
    board.cells.each {|space| valid_move?(space)}
  end

end