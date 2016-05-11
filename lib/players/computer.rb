class Player::Computer < Player
  
  def move(board)
    if board.taken?(1) == false
      return "1"
    elsif board.taken?(2) == false
      return "2"
    elsif board.taken?(3) == false
      return "3"
    elsif board.taken?(4) == false
      return "4"
    elsif board.taken?(5) == false
      return "5"
    elsif board.taken?(6) == false
      return "6"
    elsif board.taken?(7) == false
      return "7"
    elsif board.taken?(8) == false
      return "8"
    else
      return "9"
    end
  end

end

      