class GamePlay
  attr_accessor :game

  def initialize(player_1, player_2, board)
    @game = Game.new(player_1, player_2, board)
  end
  
end