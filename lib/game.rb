class Game
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5],
    [6,7,8],
    [0,3,6], #first col
    [1,4,7],
    [2,5,8],
    [0,4,8], #diag
    [2,4,6]
  ]

end
