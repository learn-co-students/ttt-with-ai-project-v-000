class Game
  attr_accessor :board, :player_1, :player_2

  def initialize
    @player_1 = self.player_1
    @player_2 = self.player_2
    @player_3 = self.player_3
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def board
    @board = []
  end

  
end