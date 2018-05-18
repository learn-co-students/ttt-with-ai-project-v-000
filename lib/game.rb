class Game

attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Players::Human.new, player_2 = Players::Human.new, board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

end
