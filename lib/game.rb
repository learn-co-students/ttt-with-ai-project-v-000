require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner
  attr_reader :game_type
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
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
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
    self.play
  end

  def play
    while !over?
      turn
      sleep(1)
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    board.display
    this_move = current_player.move(board)
    if !board.valid_move?(this_move)
      puts "invalid"
      turn
    end
    puts "#{current_player.token}'s move:"
    board.update(this_move, current_player)
  end
end
