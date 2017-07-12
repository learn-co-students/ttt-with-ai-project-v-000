module Players

class Computer < Player

  def move(token)
    # http://www.wikihow.com/Win-at-Tic-Tac-Toe
    corners = ["1","3","7","9","5","2","4","6","8"]
    # find the first that is a valid move
    corners.shift
    # expect this to go thru this and if the move is not valid it will go to the next
  end

  end
end
