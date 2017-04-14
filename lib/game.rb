class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #center column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6], #left diagonal
]

  def initialize(player_1, player_2, board)
    @player_1 = Player.new
    @player_2 = Player.new
    @board = Board.new
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      return "0"
    else
      return "X"
    end
  end

end
