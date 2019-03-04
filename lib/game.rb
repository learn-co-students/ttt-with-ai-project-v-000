class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [6,4,2]  #Right start diagonal
]



  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2 
    
  end 
  
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2 
  end 
  
  def  won?
    WIN_COMBINATIONS.detect do |winner| 
      @board.cells[winner[0]] == @board.cells[winner[1]] && 
       @board.cells[winner[1]] == @board.cells[winner[2]] &&
       (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end 
  end 

  def draw?
   @board.full? && !won? #If board is full/ && noone has won 
  end 
  
   def over?
    won? || draw?
  end 
  
  def winner 
    if winning_combo = won? 
      @winner = @board.cells[winning_combo.first]
    end 
  end 
  
  

end 



