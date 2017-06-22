class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left columns
    [1,4,7], # middle columns
    [2,5,8], # right column
    [0,4,8], # diag top left to right
    [6,4,2] #diag top right to left
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.position(combination[0]+1) == @board.position(combination[1]+1) &&
      @board.position(combination[1] + 1) == @board.position(combination[2] + 1) &&
      @board.taken?(combination[0] + 1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    win_combo = won?
    if win_combo
      winning_position = win_combo[0] + 1
      @board.position(winning_position)
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, current_player)
      @board.display
    end
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
