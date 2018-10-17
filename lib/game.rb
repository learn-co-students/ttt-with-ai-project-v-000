
class Game
  
  attr_writer :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left row
  [1,4,7], # vertical middle row
  [2,5,8], # right row
  [0,4,8], # top left diag
  [2,4,6]  # top right diag
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2      #currently initialize does nothing, working on that
    @board = board
  end
  
  def board
    board = []
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end
  
end