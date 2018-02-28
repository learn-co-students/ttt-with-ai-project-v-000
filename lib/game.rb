require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #binding.pry
    @board = board
   @player_1 = player_1
   @player_2 = player_2
 end

 def current_player
#binding.pry
   if @board.turn_count.even?
     @player_1
   else
     @player_2

   end
 end

 def over?
   @board.full?
 end


end
