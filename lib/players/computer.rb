class Computer < Player # inherits from Player


  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
  ]

  # check each board cell
  # check each win combination
  # if any two of each win combination are the same
  # fill the third index of the combination with the player token



  # returns a valid position for the computer to move
  def move(board)
    # waits 0.5 seconds to make a move
    sleep(0.5)
    board.available_moves.sample
  end

end