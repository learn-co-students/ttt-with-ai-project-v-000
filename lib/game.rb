class Game

  attr_accessor :board, :player_1, :player_2
  attr_reader :WIN_COMBINATIONS

  def initialize(board = Board.new, player_1 = Human.new("X"), player_2 = Human.new("O"))
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
  end

  def play
  end

  def turn
  end

  def current_player
    taken = @board.select {|cell| cell != " "}
    taken.length %2 == 0 ? "X" : "O"
  end

  def won?
  end

  def winner
  end

  def over?
    @board.draw? || @board.won?
  end

  def draw?
    @board.full? && !@board.won?
  end

end
