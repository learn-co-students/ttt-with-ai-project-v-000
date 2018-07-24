class Game
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
  end

  def player_1
    #provides access to player_1
  end

  def player_2
    #providess access to player_2
  end

  def initialize
    #accepts 2 players and a board
    #defaults to 2 human players, X and O, with an empty board
  end

  def current_player
    #returns the correct player, X, for the third move
  end

  def won?
    #returns false for a draw
    #returns false for a won game
    #isn't hard-coded
  end

  def draw?
    #returns true for a draw
    #returns false for a won game
    #returns false for an in-progress game
  end

  def over?
    #returns true for a draw
    #returns true for a won game
    #returns false for an in-progress game
    draw? || won?
  end

  def winner
    #returns X when X won
    #returns O when O won
    #returns false for an in-progress game
  end

  def turn
    #makes valid moves
    #asks for input again after a failed validation
    #changes to player 2 after the first turn
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
  end
end
