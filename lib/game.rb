class Game
  include Players
<<<<<<< HEAD
  attr_accessor :board, :player_1
=======
  attr_accessor :board, :player_1, :player_2
>>>>>>> 1408de68dd17236a34da8495a49806f055d7c129
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

<<<<<<< HEAD
  def board
    @board = []
  end

<<<<<<< HEAD
  def initialize(player_1 = Players::Human.new("X"))
=======
  def initialize(player_1)
>>>>>>> 2fe0c6bfc807b77b2826ac8ed8201fbc5b6005bd
    @player_1 = player_1
=======


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
>>>>>>> 1408de68dd17236a34da8495a49806f055d7c129
  end


end
