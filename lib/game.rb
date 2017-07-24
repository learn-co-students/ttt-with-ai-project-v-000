require_relative "../lib/players/human.rb"
require_relative "../lib/players/computer.rb"
class Game
  attr_accessor :board,:player_1,:player_2
  WIN_COMBINATIONS =
  [
    [0,1 ,2], # Top row
    [3,4,5],  # Midlle row
    [6,7,8], # last row
    [0,3,6], # left column
    [1,4,7], # Midlle column
    [2,5,8], # right column
    [0,4,8], # Midlle to the right
    [2,4,6], # Midlle to the left
  ]

def initialize(player1=Human.new("X"),player2=Human.new("O"),board=Board.new)
 @player_1=player1
  @player_2=player2
  @board=board
end

end
