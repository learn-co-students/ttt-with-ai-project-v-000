require 'pry'
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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # Game State methods:
  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.position(combo[0]) == board.position(combo[1]) &&
      board.position(combo[1]) == board.position(combo[2]) &&
      board.taken?(combo[0])
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if winning_combo = won?
      board.position(winning_combo[1])
    end
  end

  # Managing the game methods
  def start

  end

  def play

  end

  def turn(player)
    input = player.move
    binding.pry
    if !board.valid_move?(input)
      puts "invalid"
      turn(player)
    else
      board.update(input, player)
    end




  end
end
