class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = "X", player_2 = "O", board = [" "," "," "," "," "," "," "," "," "])
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
  end
end
