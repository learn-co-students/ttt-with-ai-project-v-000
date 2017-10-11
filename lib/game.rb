
# class Game
#   WIN_COMBINATIONS = [
#     [0,1,2], # Top row
#     [3,4,5], # Middle row
#     [6,7,8], # Bottom row
#
#     [0,3,6], #left horizontal column
#     [1,4,7], #Middle horizontal column
#     [2,5,8], #Right horizontal column
#
#     [0,4,8], #left to bottom right diagonal
#     [2,4,6] #right to bottom left diagonal
#   ]
#   attr_accessor :board,:player_1,:player_2
#
#   def initialize(player_1,player_2,board)
#
#
#
#   end
module Game
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row

    [0,3,6], #left horizontal column
    [1,4,7], #Middle horizontal column
    [2,5,8], #Right horizontal column

    [0,4,8], #left to bottom right diagonal
    [2,4,6] #right to bottom left diagonal
  ]
end
