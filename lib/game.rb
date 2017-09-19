class Game
  attr_accessor :board, :player_1, :player_2

  # Class Constants #

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]


  # Initialize #

  def initialize(player_1 = Players::Human.new(token="X"), player_2 = Players::Human.new(token="O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  # Instance Methods #

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] != " " &&
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def draw?
    won? || over?
  end

  def winner
    @board.cells[won?.first] if won?
  end

  def start
    # makes valid moves (FAILED - 1)
    #     asks for input again after a failed validation (FAILED - 2)
    #     changes to player 2 after the first turn (FAILED - 3)
  end

  def play
    #     asks for players input on a turn of the game (FAILED - 4)
    #     checks if the game is over after every turn (FAILED - 5)
    #     plays the first turn of the game (FAILED - 6)
    #     plays the first few turns of the game (FAILED - 7)
    #     checks if the game is won after every turn (FAILED - 8)
    #     checks if the game is a draw after every turn (FAILED - 9)
    #     stops playing if someone has won
    #     congratulates the winner X (FAILED - 10)
    #     congratulates the winner O (FAILED - 11)
    #     stops playing in a draw
    #     prints "Cat's Game!" on a draw (FAILED - 12)
    #     plays through an entire game (FAILED - 13)
  end

  def turn

  end





end
