module Players
  attr_accessor :board

  class Computer < Player

def move(position_number)
  possible_positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  position_number = possible_positions.sample
end

  end

end

########## Works but not AI
# def move(position_number)
#   possible_positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#   position_number = possible_positions.sample
# end

########### Doesn't work
# def move(board)
#   possible_positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#   if !board.position(5).taken?
#     board = 5
#   else
#     board = possible_positions.sample
#   end
# end