class Game
  include Players
  attr_accessor :player_1, :player_2, :board
  #defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def board
    #provides access to the board
    @board
  end

  def player_1
    #provides access to player_1
    @player_1
  end

  def player_2
    #providess access to player_2
    @player_2
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #accepts 2 players and a board; defaults to 2 human players, X and O, with an empty board
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board.display
  end

  def current_player
    #returns the correct player, X, for the third move
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    #returns false for a draw; returns the correct winning combination in the case of a win; isn't hard-coded
    WIN_COMBINATIONS.detect do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        return win_combo.to_a
      elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        return win_combo.to_a
      end
        false
    end
  end

  def draw?
    #returns true for a draw; returns false for a won game; returns false for an in-progress game
    self.board.full? && !self.won?
  end

  def over?
    #returns true for a draw; returns true for a won game; returns false for an in-progress game
    self.won? || self.draw?
  end

  def winner
    # returns X when X won; returns O when O won; returns false for an in-progress game
    if won?
      winning_array = won?
      board.cells[winning_array[0]]
    else nil
    end
  end

  def turn
    #makes valid moves
    #asks for input again after a failed validation
    #changes to player 2 after the first turn
    @user_input = current_player.move(@board)
    @board.valid_move?(@user_input) ? @board.update(@user_input, current_player) : turn
  end

  def play
    #asks for players input on a turn of the game
    #checks if the game is over after every turn
    #plays the first turn of the game
    #plays the first few turns of the game
    #checks if the game is won after every turn
    #checks if the game is a draw after every turn
    #stops playing if someone has won
    #prints "Cat's Game!" on a draw
    #plays through an entire game
    turn until over?
    if draw?
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end
end
