class Game

  attr_accessor :player_1, :player_2

  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

   WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #left vertical win
  [2,4,6] #right vertical win
]

  def board(board, index, token)
    @board
  end

  def current_player
  end

  def over?
  end

  def won?
  end

  def draw?
  end

  def winner
  end

  def turn
  end

  def play
  end

end
