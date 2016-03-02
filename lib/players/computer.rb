class Computer < Player # inherits from Player 

  # returns a valid position for the computer to move
  def move(board)
    move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
  end

end