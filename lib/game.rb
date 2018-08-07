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
  attr_accessor :player_1, :player_2, :board

  def initialize
    # @player_1 = Player.new("X")
    # @player_2 = Player.new("O")
    @board = []

    # player_1 = Player.new("X")
    # player_2 = Player.new{"O"}
  end

  def player_1=(player_1)
    @player_1 = Player.new("X")
  end

  def player_2=(player_2)
    @player_2 = Player.new("O")
  end

  def board=(board)
    @board
  end


end
