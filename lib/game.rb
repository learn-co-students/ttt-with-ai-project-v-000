class Game
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left columns
    [1, 4, 7], #middle columns
    [2, 5, 8], #right columns
    [0, 4, 8], #diagonal 1
    [2, 4, 6] #diagonal 2
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


end
