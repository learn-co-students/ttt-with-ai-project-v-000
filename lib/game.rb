class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [2,4,6], #diagonal up
    [0,4,8] #diagonal down
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    token
  end

  def token
    x_turns = board.cells.select {|c| c == "X"}
    o_turns = board.cells.select {|c| c == "O"}
    if x_turns.size <= o_turns.size
      "X"
    else
      "O"
    end
  end

end
