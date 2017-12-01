class Game
include Players

attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1=(Human.new("X")), player_2=(Human.new("O")), board=(Board.new))
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end #initialize

  def current_player
    if (@board.turn_count % 2) == 0
        @player_1
      elsif (@board.turn_count % 2) != 0
        @player_2
      end
  end #current_player




end #END GAME CLASS
