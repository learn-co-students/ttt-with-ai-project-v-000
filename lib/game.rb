class Game
  attr_accessor :board, :player_1, :player_2

  #defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

  #accepts 2 players and a board
  #defaults to two human players, X and O, with an empty board
  def initialize(player_1=Player.new("X"), player_2=Player.new("O"), board=[])
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
end
