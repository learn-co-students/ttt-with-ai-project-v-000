require 'pry'
class Players::Computer < Player 

  def move(board)
    viable = board.cells.select {|cell| cell == " " }
    (viable.index(viable.sample) + 1).to_s
  end# of move 

end# of class