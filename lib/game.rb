#The Game class is the main model of the application and represents a singular instance of a Tic-tac-toe session.
  #A game has one Board through its board property.
  #A game has two Players stored in a player_1 and player_2 property.
#Board and Player do not directly relate to the Game but do collaborate with each other through arguments.

#Beyond providing relationships with players and a board, the Game instance must also provide the basic game runtime and logic. These methods relate to the state of the game such as #current_player, #won?, and #winner. The other methods relate to managing a game, like #start, #play, and #turn. The test suite describes the method requirements.
class Game
  attr_accessor :board, :player_1, :player_2

  #defines a constant WIN_COMBINATIONS with arrays for each win combination
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

  #accepts 2 players and a board
  #defaults to two human players, X and O, with an empty board
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=[])
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
end
