class Player::Computer < Player
  def move(board)
    puts "Computer chooses a spot..."
    choice = ["1","2","3","4","5","6","7","8","9"].sample
    choice
  end
end
