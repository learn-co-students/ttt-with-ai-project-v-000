class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top-left to bottom-right diagonal
  [6,4,2]  # Top-right to bottom-left diagonal
    ]

    def initialize(player_1, player_2, board)
      @Board = board
      @player_1 = player_1
      @player_2 = player_2
    end

end
