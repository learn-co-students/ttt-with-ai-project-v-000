class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [6,4,2], [0,3,6], [1,4,7], [2,5,8]]

  def initialize(player_1 = "X", player_2 = "O", board = [])
    @player_1 = Human.new("X")
    @player_2 = Human.new("O")
    @board = board
  end

end
