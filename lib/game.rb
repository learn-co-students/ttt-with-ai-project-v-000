class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def full?
    @board.cells.all? {|board_position| %w[X O].include?(board_position)}
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|win_index| @board.cells[win_index] == @player_1 } ||
      win_combination.all? {|win_index| @board.cells[win_index] == @player_2 }
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

end