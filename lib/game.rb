require 'pry'
class Game
  
  WIN_COMBINATIONS=
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
 
  def current_player
    #binding.pry
    if @board.turn_count % 2 == 0  
      @player_1 
    else
      @player_2
    end
  end
  
  def won?
  WIN_COMBINATIONS.each do |wc_oa|     
    #win comb outer array wc_oa
   w_x = wc_oa.all?{|i| @board.cells[i] =="X"}
   w_o = wc_oa.all?{|i| @board.cells[i] =="O"}
     if w_x == true || w_o == true
       return wc_oa
     end
  end
  return false
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      winning_array = won?
      w = winning_array[0]
      return @board.cells[w]
    else
      nil
    end
  end
  
  
end