class Player::Computer < Player
  def move(board)
    corners = %w(1 3 7 9)
    random = (1..9).to_a.sample

    if board.taken?(5) == false
      5
    elsif corners.collect { |corner| board.taken?(corner) }.include?(false)
      play = corners.sample
      play = corners.sample while board.taken?(play)
      play
    else
      if board.taken?(random) == false
        random
      else random
      end
    end
  end
end
