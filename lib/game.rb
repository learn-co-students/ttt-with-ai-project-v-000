class Game
  include Players
  attr_accessor :board, :player_1
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

  def board
    @board = []
  end

  def initialize(player_1 = Players::Human.new("X"))
    @player_1 = player_1
  end


end
