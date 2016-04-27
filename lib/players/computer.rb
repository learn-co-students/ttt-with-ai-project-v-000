class Player::Computer < Player
  def move(board)
    input = rand(1..9)
    while !board.valid_move?(input)
      input
    end
    input.to_s
  end
end