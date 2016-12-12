class Player::Computer < Player

  def move(board)
    choice = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    if board.valid_move?("5")
      "5"
    elsif board.valid_move?("1")
      "1"
    elsif board.valid_move?("3")
      "3"
    elsif board.valid_move?("6")
      "6"
    else
      choice
    end
  end
end


