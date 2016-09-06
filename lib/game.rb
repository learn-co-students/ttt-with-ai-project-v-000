#The `Game` class is the main model of the application and represents a singular instance of a Tic Tac Toe session.

class Game
  #The test suite describes the method requirements.
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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1, player_2, board)
    @board= board
    @player_1= player_1
    @player_2= player_2
  end

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
