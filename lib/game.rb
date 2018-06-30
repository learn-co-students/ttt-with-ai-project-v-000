class Game
  
  attr_accessor :board, :player_1 , :player_2
  
  def initialize(player_1, player_2)
    @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if (board.turn_count == 0 || board.turn_count % 2 == 0)
      self.player_1
    else
      self.player_2
    end
  end
  
  
  
end