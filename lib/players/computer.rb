module Players
  class Computer < Player
#Going to make it simple, shuffle the array and return first number, if its taken re-shuffle.
  def move(board)
    move = nil
    array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    random_move = array.shuffle.first
  if board.taken?(random_move) == false
    move = random_move
  else
    move(board)
  end
end

end #ends class
end #ends module
