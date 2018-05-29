require 'pry'
class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [2, 5, 8], [1, 4, 7], [0, 4, 8], [2, 4, 6]]

  def current_player
    if board.turn_count.even?
      player = player_1
    else
      player = player_2
    end
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?

  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Please input 1-9:"
    input = current_player.move(board)
    if !(board.valid_move?(input))
      turn
    else
      board.display
      board.update(input, current_player)
      board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
