require 'pry'
class Game
attr_accessor :board, :player_1, :player_2

def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
 end

 def current_player
   #   # return the player whose turn it is
   #   #if move is odd return player_1 token
   if self.board.turn_count.even? #if count is even then player 2 jsut moved
      player_1
   else
     player_2
   end
 end


  WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6] ]

end
