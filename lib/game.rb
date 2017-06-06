class Game

#provides access to board, player 1 and player 2
attr_accessor :board, :player_1, :player_2

#array of winning combos
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

#initalize board and players
def initialize(board = Board.new, player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
   @board = board
   @player_1 = player_1
   @player_2 = player_2   
   @winner 
 end

#If the turn count is an even number, the #current_player method should return "X", otherwise, it should return "O"
 def current_player
     @board.turn_count.even? ? @player_1 : @player_2
 end

 def over?
   if won? || draw? || @board.full?
     return true
   else
     false
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
       
       return  true #win_combination
     elsif
         position_1 == "O" && position_2 == "O" && position_3 == "O"
       return true  #win_combination
     end
   end
   false
 end

 def draw?
    if  @board.full? && !self.won? 
      return true
    end
    return false
  end

  def winner
      if won? == true
        @board.cells[won?[0]]
      else
        return nil
      end   
  end

def turn


end 
 

end