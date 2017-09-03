class Game
    attr_accessor :board
    attr_reader :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #First cross
    [2,4,6]  #Second cross
  ]

    def initialize(player_1, player_2, board)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end



end