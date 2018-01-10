class Game
#=====================================properties======================================
  attr_accessor :player_1, :player_2, :board
#=====================================intialize=======================================
  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = p1
    self.player_2 = p2
    self.board = board
  end 
#=====================================================================================
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
#=====================================================================================
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end 
  
  def won?
    combo = WIN_COMBINATIONS.find{|c| board.cells.values_at(c[0],c[1],c[2]).uniq.count == 1 && board.cells[c[0]] != " "}
    combo.nil? ? false : combo
  end
  
#=======================================helper========================================
  def win_combo_char
    board.cells[won?[0]]
  end
#=====================================================================================  
  def draw?
    !won? && board.full?
  end
  
  def over?
    won? || draw?
  end 
  
  def winner
    win_combo_char unless !won?
  end 
  
  def turn
    move = current_player.move(board)
    board.valid_move?(move)? board.update(move, current_player) : turn
  end 
  
  def play
    while !over? && !draw?; turn end
    if won? then puts "Congratulations #{winner}!" elsif draw? then puts "Cat's Game!" end 
  end
#=====================================================================================
end


