class Player::Human < Player

 WINNERS =[[0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [6,4,2]]

  def move(board)
    input = gets
    input
  end

end

#move accepts a board and returns the move the computer wants to make. 1-9 ( do random)
#Returns a valid move for the first move but after that your program will go into an infinite loop \
#because the computer will constantly try to occupy the "1" position in the board even though it is already occupied. So don't do that.

#if its empty [] then random. 