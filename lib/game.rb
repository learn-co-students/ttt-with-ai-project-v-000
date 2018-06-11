require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board
  include Players

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]]

  def self.win_combinations
    WIN_COMBINATIONS
  end 

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? (player_1) : (player_2)
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
      board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
      board.cells[win_combination[0]] != " "
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won? then board.cells[combo[0]] end
  end

  def turn
    selection = current_player.move(board)
    if board.valid_move?(selection)
      board.update(selection, current_player)
      board.display
    else
      puts "Invalid move"
      board.display
      turn
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    board.display
  end



end
