class Player::Computer < Player
  def move(board)
    possible_moves = []
    board.cells.each.with_index(1) do |position, index|
      if position == " "
       possible_moves << index
      end
    end
    possible_moves.sample.to_s
  end

end