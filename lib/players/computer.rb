class Computer < Player # inherits from Player 

  # returns a valid position for the computer to move
  def move(board)
    # waits 0.5 seconds to make a move
    sleep(0.5)
    move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample

    # Checks for an empty cell
    while board.taken?(move)
      move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end
    move
  end

end