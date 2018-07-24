class Computer < Player
  #inherits from Player
  def move(board, index, character)
    #returns a valid position for the computer to move
    puts board[index] = character
  end
end
