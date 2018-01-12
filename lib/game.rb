class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  def initialize(player_1, player_2, board = nil)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
end




#def won?
  #WIN_COMBINATIONS.detect do |number|
   # win_index = number
    # (@board[win_index[0]] == "X"  && @board[win_index[1]] == "X"  && @board[win_index[2]] == "X") ||  (@board[win_index[0]] == "O"  && @board[win_index[1]] == "O"  && @board[win_index[2]] == "O") 
   #  end
  # end
   
    WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]