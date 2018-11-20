require 'pry'
class Game

attr_accessor :board, :player_1, :player_2, :cells, :token

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6], # right diagonal
  [0,4,8] # left diagonal
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
  end

  def current_player(token)
    binding.pry
    @token = token
  end

end
