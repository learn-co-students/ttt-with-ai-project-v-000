class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
  board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? && draw? && !board.full?
  end

  def won?
    winning_array = []
    WIN_COMBINATIONS.each do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] == board.cells[combination[2]]
      winning_array = combination
    end
    winning_array
  end

  def draw?
  end

  def winner
  end

  def turn
  end

  def play
  end

  def start
  end


end
