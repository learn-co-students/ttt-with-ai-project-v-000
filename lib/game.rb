class Game

attr_reader :board
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #lower row
  [0,4,8], #horizontal row_a
  [2,4,6], #horizontal_row_b
  [1,4,7], #vertical_row_a
  [0,3,6], #vertical_row_b
  [2,5,8], #vertical_row_c
  ]

 def board
   @board
 end

end
