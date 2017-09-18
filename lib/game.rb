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


  # Initialize #

  def initialize(player_1 = Players::Human.new(token="X"), player_2 = Players::Human.new(token="O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    @board.full?
  end

  def won?

  end

  def draw?
    over? && !won?
  end

  def winner
    @board.cells[won?[0]] if won?
  end

  def start

  end

  def play

  end

  def turn

  end





end
