class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
    #binding.pry
  end

  def won?
    #binding.pry
    WIN_COMBINATIONS.detect do |combo|
      @board.position(combo[0]) == @board.position(combo[1]) &&
      @board.position(combo[1]) == @board.position(combo[2]) &&
      @board.taken?(combo[0])
    end
  end
end
