class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end
  #These methods relate to the state of the game:
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?

  end

  def won?

  end

  def draw?

  end

  def winner

  end

  #Methods related to managing a game

  def start

  end

  def play

  end

  def turn

  end

end
