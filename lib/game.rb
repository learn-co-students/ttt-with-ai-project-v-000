class Game
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  
  #binding.pry
  
  def initialize (player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new) 
    #need to set the default of each player to a Players::Human
    #this method is expecting Player instances
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  #binding.pry
  
  def current_player
    if self.board.turn_count.odd?
      @player_2
    else 
      @player_1
    end
    #binding.pry
  end
  
  def over?
    self.board.full?
    #if won?(board) || draw?(board)
     #return true
    #elsif !(full?(board))
    # return false
    #end
  end
  
  def won?
   if self.board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     return false
   else
     WIN_COMBINATIONS.any?{|combo|
       if self.board.taken?(combo[0])
         if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] == self.board.cells[combo[2]]
           return combo
         end
       end
       }
   end
  end
  
  def draw?
  end
end