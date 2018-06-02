require 'pry'

module Players

class Computer < Player

def move(board)
  #binding.pry

  if board.cells[4] = " "
    "5"
  elsif board.cells[0] = " "
    "1"
  elsif board.cells[1] = " "
    "2"
  elsif board.cells[2] = " "
    "3"
  elsif board.cells[3] = " "
    "4"
  elsif board.cells[5] = " "
    "6"
  elsif board.cells[6] = " "
    "7"
  elsif board.cells[7] = " "
    "8"
  elsif board.cells[8] = " "
    "9"

  #"On turn 1 always try to go in the middle if you can"
  #and if not "try to go in a corner" or any logic tree
  #you can think of - there is an algorithm called Min/Max,
  #but it's going to be hard to implement given our current
  #implementation of a Game, so we recommend building something that's a more colloquial or condition-based algorithm.
end


end

end
end
