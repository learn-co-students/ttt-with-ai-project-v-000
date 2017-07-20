class Game

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #column_1_win
    [1,4,7], #column_2_win
    [2,5,8], #column_3_win
    [0,4,8], #diagonal_1_win
    [2,4,6] #diagonal_2_win
  ]

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    #@board = [" "," "," "," "," "," "," "," "," "]
  end

  attr_accessor :player1, :player2, :board

  def board
    self.board
  end

end
