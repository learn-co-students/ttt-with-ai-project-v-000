
class Game
  include Players
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def initialize(p1 = Human.new('X'), p2 = Human.new('O'), board = Board.new)
    self.board = board
    self.player_2 = p2
    self.player_1 = p1
  end
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    
  end
  
end