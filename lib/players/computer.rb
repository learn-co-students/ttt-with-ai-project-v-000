class Player::Computer < Player
  def move(board)
    valid_moves = []
    board.cells.each do |x|
      if x == " "
        valid_moves << x
      end
    end
    valid_moves.first
  end
end
