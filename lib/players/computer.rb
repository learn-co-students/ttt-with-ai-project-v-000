require_relative '../game.rb'
require_relative '../board.rb'
WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle
[6,7,8], #bottom
[0,3,6], #left down
[1,4,7], #middle down
[2,5,8], #right down
[0,4,8], # diagonal down
[6,4,2] # diagonal up
]

class Player::Computer < Player

    def move(board)

    end







end
