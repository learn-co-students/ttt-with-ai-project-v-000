class Game
  WIN_COMBINATIONS=[
    [0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]
    ]
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1, player_2, board)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end
  
  def board
    self.board
  end
  
  def current_player
    
  end
  
  def won?
    
  end
  
  def winner
    
  end
  
end