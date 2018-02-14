require 'pry'

module Players
class Computer < Player
  def move(board)  #take in the board instance.
  valid_input = ["1","2","3","4","5","6","7","8","9"]
  valid_input.sample  # sample randomly get an elements out of the array
  end

end
end
