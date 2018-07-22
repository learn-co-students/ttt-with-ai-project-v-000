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
  
  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    # WIN_COMBINATIONS.detect do |combo|
    # @board[combo[0]] == @board[combo[1]] &&
    # @board[combo[1]] == @board[combo[2]] &&
    # # position_taken?(board, combo[0])
  end

  
  
  
end