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
  [2,4,6]
]

  #State of the current game
  def current_player
  end

  def won?
  end

  def winner
  end

  #Managing a game
  def start
  end

  def play
  end

  def turn
  end




end
