class Player::Computer < Player
  def move(board)
    input = (1..9).to_a.sample
    until board.valid_move?(input) == true
      move
    end
    input.to_s
  end
end
