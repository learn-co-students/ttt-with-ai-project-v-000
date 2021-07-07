require 'pry'
class Game
  extend Players
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    input = current_player.move(@board)
    @board.valid_move?(input) ? @board.update(input, current_player) : turn
  end

  def play
    until over?
     @board.display
     puts " "
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
