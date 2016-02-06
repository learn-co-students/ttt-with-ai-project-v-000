class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(board = Array.new(9, ""), player_1, player_2)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def start
  end

  def turn
  end

  def play
  end

  


end

