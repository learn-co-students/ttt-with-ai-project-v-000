class Game
          WIN_COMBINATIONS = 
          [[0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [6,4,2]]


          attr_accessor :board, :player_1, :player_2

    def initialize(player_1=Player::Human.player_1,player_2=Player::Human.player_2,board=[])
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end


end

#song.artist = self. Instance of song is put to song variable. artist atrribute = that instant of artist we are on. 