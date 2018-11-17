class Game

attr_accessor :board, :player_1, :token, :player_2

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Middle column
  [2,5,8],  # Last column
  [0,4,8],  # diagnoal one
  [2,4,6]  # last diagnal
]

 def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board  = board
 end

 def board
   @board
 end

 def current_player
   if self.board.turn_count % 2 == 0
     player_1
   else
     player_2
   end
 end

 def won?
   WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
   	  end # end if
      end # end each
    false
 end

end
