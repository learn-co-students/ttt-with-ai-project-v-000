require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(
    player_1 = Players::Human.new("X"),
    player_2 = Players::Human.new("O"),
    board = Board.new
  )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |c|
      board.taken?(c[0] + 1) &&
      board.cells[c[0]] == board.cells[c[1]] &&
      board.cells[c[0]] == board.cells[c[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if combo = won?
      winner = board.cells[combo.first]
    end
    winner
  end

  def turn
    
  end
end
