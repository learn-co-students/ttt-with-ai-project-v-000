class Game
 
attr_accessor :board, :player_1, :player_2


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = nil)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end# of initialize

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]




end# of class
