require 'pry'
class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #center column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6], #left diagonal
]

  def initialize(player_1 = Players::Human("X"), player_2 = Players::Human("O"), board = " ")
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def over?

  end

  def won?

  end

  def draw?

  end

  def winner

  end
end
