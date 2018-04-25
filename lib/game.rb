class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #<- Top-Row Win
    [3,4,5], #<- Middle-Row Win
    [6,7,8], #<- Bottom-Rown Win
    [0,3,6], #<- Left-Column Win
    [1,4,7], #<- Middle-Column Win
    [2,5,8], #<- Right-Column Win
    [0,4,8], #<- Left-Diagnal Win
    [6,4,2]] #<- Right-Diagnal Win

    def initialize(player_1 = Players::Human, player_2 = Players::Human, board)
      @player_1 = player_1
      @player_2 = player_2
    end
end
