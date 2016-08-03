require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner
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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # Game State methods:
  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells.at(combo[0]) == board.cells.at(combo[1]) &&
      board.cells.at(combo[1]) == board.cells.at(combo[2]) &&
      board.taken?(combo[0])
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end

  # Managing the game methods
  def start

  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{@winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    this_move = current_player.move(board)
    if !board.valid_move?(this_move)
      puts "invalid"
      turn
    end
    board.update(this_move, current_player)
  end
end
