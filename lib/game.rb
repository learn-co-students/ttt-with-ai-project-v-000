class Game
  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    # horizontal wins
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    # vertical wins
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    # diagonal wins
    [0, 4, 8], # top left to bottom right diagonal
    [2, 4, 6] # top right to bottom left diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[0]] == @board.cells[win_combo[2]]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    win = won?
    win ? @board.cells[win.first] : nil
  end

  def turn
    # makes a valid_move?
    # asks for input if !valid_move?
    # changes to player_2 after first turn
    
  end


end
