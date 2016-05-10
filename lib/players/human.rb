class Player::Human < Player

  attr_reader :player_1, :player_2

  def player_1
    @player_1 = "X"
  end

  def player_2
    @player_2 = "O"
  end

  def move(board)
    input = gets
    input
  end

end

#move accepts a board and returns the move the computer wants to make. 1-9 ( do random)
#Returns a valid move for the first move but after that your program will go into an infinite loop \
#because the computer will constantly try to occupy the "1" position in the board even though it is already occupied. So don't do that.

#if its empty [] then random. 