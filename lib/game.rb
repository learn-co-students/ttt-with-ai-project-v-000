class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end 
  
  def won?
    WIN_COMBINATIONS.each do |win_comb|
      position_1 = board.cells[win_comb[0]]
      position_2 = board.cells[win_comb[1]]
      position_3 = board.cells[win_comb[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
        return win_comb
      end
    end 
    false 
  end
  
  def draw?
    if won? == false && board.full? == true 
      return true 
    else 
      return false 
    end 
  end
  
  def over?
    if won? || draw? == true || board.full? == true 
      return true 
    end 
  end 
    
end 