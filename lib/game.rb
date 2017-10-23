class Game

  attr_reader :board

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # First diagonal
    [2,4,6]  # Second diagonal
  ]

  def initialize
    @board = []
  end

end
