class Game

    attr_accessor :player_1, :player_2, :board, :cells


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
    
    def board
        @game = []
    end
    
    def initialize(player_1 = "X", player_2 = "O", board = nil)
        @player_1 = player_1
        @player_2 = player_2
        # cells.board
        # @board = # @board = board
    end
    
end