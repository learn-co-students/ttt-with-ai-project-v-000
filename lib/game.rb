require "pry"
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :tokens

  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row_win
    [3, 4, 5], #middle_row_win
    [6, 7, 8], #bottom_row_win
    [0, 3, 6], #left_collumn_win
    [1, 4, 7], #middle_collumn_win
    [2, 5, 8], #right_collumn_win
    [0, 4, 8], #left_diagonal_win
    [2, 4, 6] #right_diagonal_win
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || self.board.full?
  end
# below method added and attr_reader :tokens added on line 4
  def win_tokens
    @tokens = WIN_COMBINATIONS.map {|combo| combo.map {|index| board.cells[index]}}
    # should return the token at each index of each array of winning combos relative to the game board
    # which is now an instance variable, reader access granted in attr_reader
  end
# below method changed, original commented out
  def won? # should return true or false - currently doesnt do that
    #WIN_COMBINATIONS.detect do |combo|
    #  board.cells[combo[0]] == board.cells[combo[1]] &&
    #  board.cells[combo[1]] == board.cells[combo[2]]
    win_tokens
    tokens.include?(["X", "X", "X"]) || win_tokens.include?(["O", "O", "O"])
    # true if the tokens array from win_tokens includes a set of all Xs or all Os
  end


  def draw?
    !won? && board.full?
  end

  def winner
    #if won? == nil
    #  winning_combo = won?
    #  board.cells[winning_combo[0]]
    #else
    #  nil
    #end
# nope
    #if won?
    #  tokens.detect{ |combo| combo == ["X", "X", "X"] || combo == ["O", "O", "O"]}
    #else
    #  nil
    #end
# more nope
    #winning_combo = WIN_COMBINATIONS.detect do |combo|
    #  board.cells[combo[0]] == board.cells[combo[1]] &&
    #  board.cells[combo[1]] == board.cells[combo[2]]
    #end
    #board.cells[winning_combo[0]]
# still more nope but wait
    win_tokens
    winning_combo = tokens.detect {|combo| combo == ["X", "X", "X"] || combo == ["O", "O", "O"]}

    if won?
      winning_combo[0]
    else
      nil
    end
  end

  def turn
  end

  def play
  end
end
