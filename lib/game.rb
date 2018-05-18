class Game 
  
  attr_accessor :board, :player_1
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def board
    @board = []
  end
  
  def player_1
    @player_1 = Player.new("X")
  end
end 


# learn --fail-fast