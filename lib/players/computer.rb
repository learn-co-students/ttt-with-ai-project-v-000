class Player::Computer < Player
  def move(board)
    if !board.taken?("5")
      "5"
    elsif !board.taken?("1")
      "1"
    elsif !board.taken?("3")
      "3"
    elsif !board.taken?("7")
      "7"
    elsif !board.taken?("9")
      "9"
    else
      (0..8).to_a.sample
    end
  end
end