class Game
  attr_accessor :board

  def initialize
    @board = board
  end

  WIN_COMBINATIONS =
    [
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right columnlib
      [0,4,8], # left diagonal
      [2,4,6]  # right diagonal
    ]

end
