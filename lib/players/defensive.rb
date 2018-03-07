class Defensive
  def middle_move(board)
    board.taken?("5")? ["1", "3", "4", "6", "7", "9"].sample : "5"
  end

end
