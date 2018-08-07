class Game

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

  attr_accessor :board
  attr_reader :player_1, :player_2

  def initialize#(player_1, player_2, board = Board.new)

  end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end


end
