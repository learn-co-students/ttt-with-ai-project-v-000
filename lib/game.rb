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

  def win_tokens
    @tokens = WIN_COMBINATIONS.map {|combo| combo.map {|index| board.cells[index]}}
    # return the token at each index of each array of winning combos relative to the game board
    # which is now an instance variable, reader access granted in attr_reader
  end

  def won?
    win_tokens
    tokens.include?(["X", "X", "X"]) || win_tokens.include?(["O", "O", "O"])
    # true if the tokens array from win_tokens includes a set of all Xs or all Os
  end


  def draw?
    !won? && board.full?
  end

  def winner
    win_tokens
    winning_combo = tokens.detect {|combo| combo == ["X", "X", "X"] || combo == ["O", "O", "O"]}
    # the first match of all Xs or all Os is now saved as a variable
    won? ? winning_combo[0] : nil
  end

  def turn
    player = current_player
    move = player.move(board)
    if board.valid_move?(move)
      board.update(move, player)
      board.display
    else
      board.display
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
