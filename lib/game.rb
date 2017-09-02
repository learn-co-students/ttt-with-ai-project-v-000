class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1, player_2, board)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] \
      && @board[win_combination[2]] == @board[win_combination[1]] \
      && @board[win_combination[0]] != " "
    end
  end


#   def draw?
#    full? && !won?
#   end
#
#   def over?
#     full? || won? || draw?
#   end
end
