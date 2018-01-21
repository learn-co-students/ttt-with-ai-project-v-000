require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # returns the correct player, X, for the third move
    # Takes the number of turns on the board and divides it by 2. If it has a remainder of 2 it returns player X else player O
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    @board.full? || self.won? || self.draw?
  end

  def won?
    # returns false for a draw
    # returns the correct winning combination in the case of a win
    # detect returns the first match it finds in the array of what you're looking for
    # Create variables to hold the win combination from our WIN_COMBINATIONS constant, use those variable to figure out
    # the winning positions, and figure out if X or O are in them.
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1  == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end #if
    end # detect
  end #method

  def draw?
    # returns true for a draw
    # returns false for a won game
    # returns false for an in-progress game
    @board.full? && !self.won?
  end

  def winner
    # returns X when X won
    # returns O when O won
    # returns nil when no winner
    self.won? ? @board.cells[self.won?[0]] : nil
  end

  def turn
    # makes valid moves
    # asks for input again after a failed validation
    # uses the player class move method to input their move (and return their input), check if they're making a valid move
    # and update the board. If an invalid move is put in, it runs the method over again.
    @board.display
    user_input = self.current_player.move(@board.cells)
    @board.valid_move?(user_input) ? @board.update(user_input.to_i, self.current_player) : self.turn
  end

  def play
    # asks for players input on a turn of the game
    # checks if the game is over after every turn
    # plays the first turn of the game
    # plays the first few turns of the game
    # checks if the game is won after every turn
    # checks if the game is a draw after every turn
    # stops playing if someone has won
    self.turn until self.over?
    self.won? ? puts("Congratulations #{self.winner}!") : puts("Cat's Game!")
  end

end
