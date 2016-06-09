class Computer < Player

  def move(array)   #why array is needed here?  array = @cells ?
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_moves.sample
  end

end
