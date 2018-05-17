# The Game class is the main model of the application
# and represents a singular instance of a Tic-tac-toe session.

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
      [0,1,2], # top_row
      [3,4,5], # middle_row
      [6,7,8], # bottom_row
      [0,3,6], # left_column
      [1,4,7], # center_column
      [2,5,8], # right_column
      [0,4,8], # left_diagonal
      [6,4,2]  # right_diagonal
    ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def draw?
    won? == nil && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
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
