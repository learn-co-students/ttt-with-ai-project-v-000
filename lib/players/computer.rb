class Player::Computer < Player
  @next_move = 1
  def move(board)
    if !board.taken?(5)
      "5"
    elsif !board.taken?(@next_move)
      "#{@next_move}"
    else
      @next_move += 1
      move
    end
  end
end