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
  def initialize()
    binding.pry

  end

  def current_player
  end

  def won?
  end

  def draw?
  end

  def over?
  end

  def play
  end

  def turn
  end
end
