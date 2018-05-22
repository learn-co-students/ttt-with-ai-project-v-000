class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human("X") , player_2 = Players::Human("O"), board = Board.new)
    @board = board 
    @player_1 = player_1
    @player_2 = player_2
  end 
end 