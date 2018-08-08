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


  # attr_accessor :board
  attr_reader :player_1, :player_2, :board

   def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
  end

  def player_1=(player_1)
    @player_1 = player_1
    player_1 = Players::Human
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def board=(board)
    @board = board
  end


end
