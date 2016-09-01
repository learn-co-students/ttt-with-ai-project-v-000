#The `Game` class is the main model of the application and represents a singular instance of a Tic Tac Toe session.

class Game
  #The test suite describes the method requirements.

  @board = [" "," "," "," "," "," "," "," "," "]
  #A game has one `Board` through its `board` property.
  @player_1 = []
  @player_2 = []
  #A game has two `Player`s stored in a `player_1` and `player_2` property.
  #`Board` and `Player` do not directly relate to the `Game` but do collaborate with each other through arguments.

  #Beyond providing relationships with players and a board, the `Game` instance must also provide the basic game runtime and logic.

  #These methods relate to the state of the game:
  def current_player

  end

  def won?

  end

  def winner

  end

  #Methods related to managing a game

  def start

  end

  def play

  end

  def turn

  end

end
