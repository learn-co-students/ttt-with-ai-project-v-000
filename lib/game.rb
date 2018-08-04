class Game 
  WIN_COMBINATIONS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                       [0, 3, 6], [1, 4, 7], [2, 5, 8],
                       [0, 4, 8], [2, 4, 6] ]
  attr_accessor :board 
  attr_accessor :player_1, :player_2
  
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Array.new(9, " "))   
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board 
  end 
  
  def current_player (board)
    board.turn_count % 2 == 0? player_1 : player_2
  end  
  
  def won? 
    
  end
  
  def draw?
  end
  
  def over? 
  end
  
  def winner 
  end 
  
  def start 
  end 
  
  def play 
  end
  
  def turn 
  end 
end 