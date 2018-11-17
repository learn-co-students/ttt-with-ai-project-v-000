class Game

attr_accessor :board, :player_1, :token

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # diagnoal one
  [2,4,6]  # last diagnal
]

  def player_1(token)
    self.Player.new
  end

end
