require 'pry'
require_relative './text.rb'
class Game
  include Text

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
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0] + 1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[0]] == board.cells[combo[2]]
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
    sleep 1 if current_player.class == Players::Computer
    prompt
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      divider_text
      board.display
      divider_text
    else
      turn
    end
  end

  def play
    current_player.class == Players::Human ? human_text : ai_text
    turn while !over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    celebrate_text
  end
end
